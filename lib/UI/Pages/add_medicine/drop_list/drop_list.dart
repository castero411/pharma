import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';
import 'package:medicine_manager/models/drug_type.dart';

// ignore: must_be_immutable
class DropList extends StatelessWidget {
  DropList({super.key, required this.currentValue});
  String currentValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: xLightTextColor, // Your custom border color
            width: 2.0, // Border width
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: xLightTextColor, // Your custom border color for focus
            width: 2.0, // Border width for focus
          ),
        ),
      ),
      focusColor: xScaffoldColorLight,
      dropdownColor: xScaffoldColorLight,
      borderRadius: BorderRadius.circular(20),
      value: currentValue,
      onChanged: (value) {
        currentValue = value.toString();
      },
      items: [
        for (final drugs in drugType)
          DropdownMenuItem(
            value: drugs,
            child: Text(
              drugs.split('.').last,
              style: smallTextStyle,
            ),
          )
      ],
    );
  }
}
