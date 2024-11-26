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
    iconTheme: IconThemeData(color: xLightTextColor));

var darkTheme = ThemeData.dark().copyWith();
