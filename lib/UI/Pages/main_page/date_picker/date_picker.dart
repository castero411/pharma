import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:medicine_manager/UI/Theme/colors.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: xMainColor,
      selectedTextColor: Colors.white,
      height: 100,
      width: 50,
      locale: 'en_us',
    );
  }
}
