import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:medicine_manager/UI/Theme/Text_style.dart';

import '../common/widgets/custom_form_field.dart';
import '../common/widgets/wide_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _email;
  String? _password;

  bool obscure = true;

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter your username";
    } else if (value.contains('@')) {
      return null;
    }
    return 'please enter a valid email';
  }

  void onUsernameSave(String? value) {
    _username = value;
  }

  void onEmailSave(String? value) {
    _email = value;
  }

  void onPasswordSave(String? value) {
    _password = value;
  }

  @override
  Widget build(BuildContext context) {
    double gapSize = 28; // for eazier customization when adding flexability

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(23),
        child: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.jpg'),
                    Gap(gapSize * 2),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Create a new account',
                        textAlign: TextAlign.left,
                        style: bigTextStyle,
                      ),
                    ),
                    Gap(gapSize),
                    CustomFormField(
                      // username text form field
                      hint: 'Name',
                      obscure: false,
                      validator: usernameValidator,
                      onSave: onUsernameSave,
                    ),
                    Gap(gapSize - 5),
                    CustomFormField(
                      // password text form field
                      hint: 'Email',
                      obscure: obscure,
                      onSave: onEmailSave,
                    ),
                    Gap(gapSize),
                    CustomFormField(
                      // password text form field
                      hint: 'Password',
                      obscure: obscure,
                      onSave: onPasswordSave,
                    ),
                    Gap(gapSize),
                    WideButton(
                      title: 'Sign up',
                      onTap: () {},
                    ),
                    Gap(gapSize * 2),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
