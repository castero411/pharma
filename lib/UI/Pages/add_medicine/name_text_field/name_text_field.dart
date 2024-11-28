import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 261,
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        cursorColor: xLightTextColor,
        decoration: InputDecoration(
          labelText: "Name",
          labelStyle: labelTextStyle,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: xLightTextColor,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: xLightTextColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
