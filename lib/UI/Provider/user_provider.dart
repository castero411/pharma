import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/shared_preferences/shared_preferences_service.dart';

class User {
  final String userId;
  final String username;

  User({required this.userId, required this.username});
}

final userProvider = StateProvider<User?>((ref) => null);
final sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((ref) {
  return SharedPreferencesService();
});

// To set the user
Future<void> setUser(WidgetRef ref, String userId, String username) async {
  final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
  await sharedPreferencesService.saveUser(userId, username);

  ref.read(userProvider.notifier).state =
      User(userId: userId, username: username);
}

// To clear the user (on logout)
Future<void> clearUser(WidgetRef ref) async {
  final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
  await sharedPreferencesService.clearUser();

  ref.read(userProvider.notifier).state = null;
}

// To check if the user is stored in SharedPreferences on app start
Future<void> setUserFromSharedPreferences(WidgetRef ref) async {
  final sharedPreferencesService = ref.read(sharedPreferencesServiceProvider);
  final userData = await sharedPreferencesService.getUser();

  if (userData != null) {
    ref.read(userProvider.notifier).state = User(
      userId: userData['userId']!,
      username: userData['username']!,
    );
  }
}
