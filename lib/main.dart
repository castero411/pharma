import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Pages/main_page/main_page.dart';
import 'UI/Theme/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    //unpausing and entering the main application
    FlutterNativeSplash.remove();

    return MaterialApp(
      theme: lightTheme,
      home: MainPage(),
    );
  }
}
