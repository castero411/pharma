import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicine_manager/models/medicine.dart';

Future<List<Medicine>> getMedicines() async {
  try {
    // Get the current user's UID
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    final String uid = user.uid;

    // Reference the user's medicines subcollection in Firestore
    final medicinesCollectionRef = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('medicines');

    // Get all the medicine documents
    final snapshot = await medicinesCollectionRef.get();

    // Convert Firestore documents to a list of Medicine objects
    final medicines = snapshot.docs.map((doc) {
      return Medicine.fromMap(doc.data());
    }).toList();

    return medicines;
  } catch (e) {
    print("Error retrieving medicines from Firestore: $e");
    return [];
  }
}
