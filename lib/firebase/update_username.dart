import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> editUserInfo(
    String userId, String newUsername, String age, String gender) async {
  try {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await users.doc(userId).update({
      'username': newUsername,
      'gender': gender,
      'age': age,
    });
  } catch (e) {
    print("failed to update username");
  }
}

Future<void> editUserInfoNoName(
    String userId, String age, String gender) async {
  try {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await users.doc(userId).update({
      'gender': gender,
      'age': age,
    });
  } catch (e) {
    print("failed to update username");
  }
}
