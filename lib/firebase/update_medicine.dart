import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateMedicineState(
    String medicineName, String date, String time) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    final String uid = user.uid;

    // Reference the user's document in Firestore
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Construct the field path for the nested map
    final fieldPath = 'medicines.$medicineName.takenDate.$date.$time';

    // Update Firestore using FieldValue to toggle the boolean value
    await userDocRef.update({
      fieldPath: true,
    });
  } catch (e) {
    print('Failed to update medicine state: $e');
  }
}

Future<void> updateMedicineStateToFalse(
    String medicineName, String date, String time) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception("No user is currently signed in.");
    }
    final String uid = user.uid;

    // Reference the user's document in Firestore
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);

    // Construct the field path for the nested map
    final fieldPath = 'medicines.$medicineName.takenDate.$date.$time';

    // Update Firestore using FieldValue to toggle the boolean value
    await userDocRef.update({
      fieldPath: false,
    });
  } catch (e) {
    print('Failed to update medicine state: $e');
  }
}
