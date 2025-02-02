import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Map<String, dynamic>>> getMedicinesDates() async {
  try {
    // Get the current user's UID
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    final String uid = user.uid;

    // Reference the user's document in Firestore
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Get the medicines map from the user's document
    final snapshot = await userDocRef.get();

    if (!snapshot.exists || snapshot.data() == null) {
      return []; // Return an empty list if no data exists
    }

    final medicinesMap = snapshot.data()?['medicines'] as Map<String, dynamic>?;

    if (medicinesMap == null) {
      return []; // Return an empty list if the medicines map is null
    }

    // Extract only name and takenDate
    final medicineDates = medicinesMap.entries.map((entry) {
      return {
        "name": entry.key,
        "takenDate": entry.value['takenDate'] != null
            ? Map<String, bool>.from(entry.value['takenDate'])
            : {},
      };
    }).toList();

    return medicineDates;
  } catch (e) {
    print("Error retrieving medicines from Firestore: $e");
    return [];
  }
}
