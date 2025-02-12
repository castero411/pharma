import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Provider/theme_provider.dart';
import 'package:medicine_manager/UI/Theme/Text_style.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

final appThemes = {
  AppTheme.light1: lightTheme1,
  AppTheme.light2: lightTheme2,
  AppTheme.dark1: darkTheme1,
  AppTheme.dark2: darkTheme2,
  AppTheme.light3: lightTheme3
};

var lightTheme1 = ThemeData.light().copyWith(
  scaffoldBackgroundColor: xScaffoldColorLight,
  indicatorColor: xLightTextColor,
  appBarTheme: AppBarTheme(
    backgroundColor: xScaffoldColorLight,
    titleTextStyle: bigTextStyle,
  ),
  hoverColor: xContainerColor,
  hintColor: xHintColor,
  iconTheme: IconThemeData(color: xLightTextColor),
  primaryColor: xMainColor,
  buttonTheme: ButtonThemeData(buttonColor: xMainColor),
  colorScheme: ColorScheme.light().copyWith(
      primary: xMainColor,
      onPrimary: xScaffoldColorLight,
      secondary: xSecondaryColor,
      onSecondary: xSecondaryColor.withOpacity(.3),
      primaryContainer: xMainColor.withAlpha(10)),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: xEnabledBorder),
);

var darkTheme1 = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    primary: xMainColor,
  ),
  hoverColor: xContainerColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(20, 41, 38, 0.902)),
  primaryColor: xMainColor,
  appBarTheme: AppBarTheme().copyWith(backgroundColor: xScaffoldColorDark),
  scaffoldBackgroundColor: xScaffoldColorDark,
);

var lightTheme2 = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(254, 253, 248, 1),
      titleTextStyle: bigTextStyle,
    ),
    hoverColor: Color.fromRGBO(238, 222, 237, 1),
    primaryColor: Color.fromRGBO(78, 83, 117, 1),
    indicatorColor: Color.fromRGBO(47, 51, 73, 1),
    iconTheme: IconThemeData(color: Color.fromRGBO(78, 83, 117, 1)),
    scaffoldBackgroundColor: Color.fromRGBO(254, 253, 248, 1),
    colorScheme: ColorScheme(
      primary: Color.fromRGBO(25, 31, 68, 1),
      brightness: Brightness.light,
      onPrimary: Color.fromRGBO(254, 253, 248, 1),
      // secondary: Color.fromRGBO(238, 222, 237, 1),
      secondary: Colors.black,
      onSecondary: Color.fromRGBO(254, 253, 248, 1),
      error: Color.fromRGBO(186, 26, 26, 1),
      onError: Colors.white,
      surface: Color.fromRGBO(254, 253, 248, 1),
      onSurface: Color.fromRGBO(14, 26, 16, 1),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(148, 154, 178, 1)));

var darkTheme2 = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    primary: xMainColor,
  ),
  hoverColor: Color.fromRGBO(238, 222, 237, 1),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromRGBO(148, 154, 178, 1)),
  primaryColor: Color.fromRGBO(79, 88, 145, 1),
  appBarTheme: AppBarTheme().copyWith(backgroundColor: xScaffoldColorDark),
  scaffoldBackgroundColor: xScaffoldColorDark,
);

var lightTheme3 = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromRGBO(255, 253, 241, 1),
      titleTextStyle: bigTextStyle,
    ),
    hoverColor: Color.fromRGBO(237, 228, 208, 1),
    primaryColor: Color.fromRGBO(57, 85, 63, 1),
    indicatorColor: Color.fromRGBO(15, 41, 21, 1),
    iconTheme: IconThemeData(color: Color.fromRGBO(14, 26, 16, 1)),
    scaffoldBackgroundColor: Color.fromRGBO(255, 253, 241, 1),
    colorScheme: ColorScheme(
      primary: Color.fromRGBO(57, 85, 63, 1),
      brightness: Brightness.light,
      onPrimary: Color.fromRGBO(254, 253, 248, 1),
      // secondary: Color.fromRGBO(238, 222, 237, 1),
      secondary: Color.fromRGBO(231, 179, 67, 1),
      onSecondary: Color.fromRGBO(254, 253, 248, 1),
      error: Color.fromRGBO(186, 26, 26, 1),
      onError: Colors.white,
      surface: Color.fromRGBO(254, 253, 248, 1),
      onSurface: Color.fromRGBO(14, 26, 16, 1),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(231, 179, 67, 1)));
