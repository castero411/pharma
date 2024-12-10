import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

var lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: xScaffoldColorLight,
  indicatorColor: xLightTextColor,
  appBarTheme: AppBarTheme(
    backgroundColor: xScaffoldColorLight,
    titleTextStyle: bigTextStyle,
  ),
  hintColor: xHintColor,
  iconTheme: IconThemeData(color: xLightTextColor),
  primaryColor: xMainColor,
  buttonTheme: ButtonThemeData(buttonColor: xMainColor),
  textTheme: TextTheme(
    titleLarge: bigTextStyle,
    bodyLarge: veryBigTextStyle,
    bodySmall: smallTextStyle,
    labelMedium: smallTextStyle,
    labelLarge: labelTextStyle,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: xEnabledBorder,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: xLightTextColor,
        width: 2.0,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 2.0,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.redAccent,
        width: 2.0,
      ),
    ),
  ),
);

var darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.black,
  buttonTheme: ButtonThemeData(buttonColor: xMainColor),
);
