import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, required this.obscureText, required this.hintText, required this.validator, required this.onSaved});

  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),child: TextFormField(
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText
    ),
    validator: validator,
    onSaved: onSaved,
    ),);
  }
}