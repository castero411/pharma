import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Pages/login_page/login_page.dart';
import 'UI/Theme/theme.dart';

void main() {
  runApp(const MedcalApp());
}

class MedcalApp extends StatelessWidget {
  const MedcalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: LoginPage(),
    );
  }
}
