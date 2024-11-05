import 'package:flutter/material.dart';

import 'widgets/text_field.dart';
import 'widgets/wide_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const SizedBox mediumBox = SizedBox(
    height: 26,
  );
  static const SizedBox bigBox = SizedBox(
    height: 60,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/Logo.png'),
            bigBox,
            CustomTextField(hint: "username"),
            mediumBox,
            CustomTextField(
              hint: "password",
              hideText: true,
            ),
            bigBox,
            WideButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
