import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Pages/common/custom_form_field.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(23),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.jpg'),
                Gap(49),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Welcome Back!',
                    textAlign: TextAlign.left,
                    style: bigTextStyle,
                  ),
                ),
                Gap(28),
                CustomFormField(
                  hint: 'username',
                  obscure: false,
                  onSave: (value) {},
                ),
                Gap(28),
                CustomFormField(
                    hint: 'Password', obscure: obscure, onSave: (value) {}),
                Gap(60),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
