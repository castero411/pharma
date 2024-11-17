// main.dart
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicine_manager/UI/Pages/add_medicine/add_medicine.dart';
import 'package:medicine_manager/UI/Pages/display_page/display_page.dart';
import 'package:medicine_manager/UI/Pages/main_page/main_page.dart';
import 'package:medicine_manager/UI/Pages/notifications_page/notifications_page.dart';
import 'package:medicine_manager/UI/Pages/settings_page/settings_page.dart';
import 'UI/Pages/login_page/login_page.dart';
import 'UI/Pages/signup page/signup_page.dart';
import 'UI/Theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ProviderScope(child: const MedicalApp()));
}

class MedicalApp extends StatefulWidget {
  const MedicalApp({super.key});

  @override
  State<MedicalApp> createState() => _MedicalAppState();
}

class _MedicalAppState extends State<MedicalApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // Pausing for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    // Unpausing and entering the main application
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: AddMedicine(),
      routes: {
        'login_page': (context) => LoginPage(),
        'signup_page': (context) => SignupPage(),
        'main_page': (context) => MainPage(),
        'settings': (context) => SettingsPage(),
        'notifications': (context) => NotificationsPage(),
        'display': (context) => DisplayPage(),
        'add_medicine': (context) => AddMedicine(),
      },
    );
  }
}
