import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final FormFieldValidator<String?>? validator;
  final TextEditingController controller;

  const CustomFormField(
      {super.key,
      required this.hint,
      required this.obscure,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      obscureText: obscure,
      validator: validator,
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.only(left: 20, top: 35),
        hintStyle: TextStyle(color: Theme.of(context).hintColor),
      ),
    );
  }
}
