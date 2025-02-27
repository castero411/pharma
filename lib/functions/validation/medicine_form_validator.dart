import 'package:flutter/widgets.dart';

FormFieldValidator hasNumber = (value) {
  final numericRegex = RegExp(r'^\d+$');
  if (value == null || value == '') {
    return 'please enter a valid number';
  }
  if (!(numericRegex.hasMatch(value))) {
    return 'please enter numbers only';
  }
  return null;
};

FormFieldValidator nameValidator = (value) {
  if (value == null || value == '') {
    return 'please enter a valid name';
  }
  if (value.length > 30) {
    return 'name is bigger than 30';
  }
  if (value.length < 4) {
    return 'name is less than 4';
  }
  return null;
};

FormFieldValidator hasDecimalNumber = (value) {
  final decimalRegex =
      RegExp(r'^\d+(\.\d+)?$'); // Matches integers and decimal numbers
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a valid number';
  }
  if (!decimalRegex.hasMatch(value)) {
    return 'Please enter a valid decimal number';
  }
  return null;
};
