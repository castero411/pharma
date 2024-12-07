import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_manager/models/medicine.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add Medicine for a specific user
  Future<void> addMedicine(String userId, Medicine medicine) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('medicines')
        .doc(medicine.id)
        .set(medicine.toMap());
  }

  // Get Medicines for a specific user
  Future<List<Medicine>> getMedicines(String userId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('medicines')
        .get();
    return snapshot.docs.map((doc) => Medicine.fromMap(doc.data())).toList();
  }

  // Update Medicine for a specific user
  Future<void> updateMedicine(
      String userId, String medicineId, Medicine updatedMedicine) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('medicines')
        .doc(medicineId)
        .update(updatedMedicine.toMap());
  }

  // Delete Medicine for a specific user
  Future<void> deleteMedicine(String userId, String medicineId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('medicines')
        .doc(medicineId)
        .delete();
  }

  // Mark a medicine as taken for a specific user
  Future<void> markAsTaken(
      String userId, String medicineId, DateTime date) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('taken_status')
        .doc(medicineId)
        .collection('dates')
        .doc(date.toIso8601String())
        .set({'taken': true});
  }

  // Check if a medicine was taken for a specific user
  Future<bool> isTaken(String userId, String medicineId, DateTime date) async {
    final doc = await _firestore
        .collection('users')
        .doc(userId)
        .collection('taken_status')
        .doc(medicineId)
        .collection('dates')
        .doc(date.toIso8601String())
        .get();

    return doc.exists && doc.data()?['taken'] == true;
  }
}
