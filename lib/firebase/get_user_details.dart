import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<(String age, String gender)> getUserDetails() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    final String uid = user.uid;

    // Reference Firestore document
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);
    final docSnapshot = await userDocRef.get();

    if (!docSnapshot.exists || docSnapshot.data() == null) {
      throw Exception("User document not found.");
    }

    // Safely extract values with default fallbacks
    String age = docSnapshot.data()?['age']?.toString() ?? '';
    String gender = docSnapshot.data()?['gender']?.toString() ?? '';

    return (age, gender);
  } catch (e) {
    print("Error fetching user details: $e");
    throw Exception("Failed to fetch user details.");
  }
}
