import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/custom_form_field.dart';
import 'package:medicine_manager/UI/Pages/common/widgets/wide_button.dart';
import 'package:medicine_manager/UI/Pages/login_page/widgets/login_with_button.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';
import 'package:medicine_manager/functions/validation/email_form_validation.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  bool obscure = true;

  void onUsernameSave(String? value) {
    _username = value;
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
                  //Image.asset('assets/logo.jpg'),
                  Text(
                    'LOGO',
                    style: TextStyle(
                        color: xMainColor,
                        fontSize: 50,
                        fontWeight: FontWeight.w900),
                  ),
                  Gap(gapSize * 2),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Welcome Back!',
                      textAlign: TextAlign.left,
                      style: bigTextStyle,
                    ),
                  ),
                  Gap(gapSize),
                  CustomFormField(
                    // username text form field
                    hint: 'Email',
                    obscure: false,
                    validator: usernameValidator,
                    onSave: onUsernameSave,
                  ),
                  Gap(gapSize - 5),
                  CustomFormField(
                    // password text form field
                    hint: 'Password',
                    obscure: obscure,
                    validator: passwordValidator,
                    onSave: onPasswordSave,
                  ),
                  Gap(gapSize),
                  WideButton(
                    title: 'Log in',
                    onTap: () {
                      // excute the logi process
                      print("logged in");
                    },
                  ),
                  Gap(gapSize * 2),
                  Divider(),
                  Gap(gapSize),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoginWithButton(
                        onTap: () {},
                        faIcon: FontAwesomeIcons.google,
                      ),
                      LoginWithButton(
                          onTap: () {
                            print("hello");
                          },
                          faIcon: FontAwesomeIcons.facebook)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
