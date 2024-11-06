import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Pages/login_page/login_page.dart';
import 'package:medicine_manager/UI/Pages/main_page/main_page.dart';
import 'UI/Theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MedicalApp());
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
    //pausing for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
    //unpausing and entering the main application
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: LoginPage(),
    );
  }
}
