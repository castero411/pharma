import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/firebase/get_user_details.dart';

class UserInfoNotifier extends StateNotifier<Map<String, String>> {
  UserInfoNotifier() : super({"age": "", "gender": ""});

  Future<void> updateInfo() async {
    try {
      var (age, gender) = await getUserDetails(); // Await the function

      state = {
        "age": age,
        "gender": gender,
      };
      print("update done");
    } catch (e) {
      print("Error updating user info: $e");
    }
  }
}

final userInfoProvider =
    StateNotifierProvider<UserInfoNotifier, Map<String, String>>(
  (ref) => UserInfoNotifier(),
);
