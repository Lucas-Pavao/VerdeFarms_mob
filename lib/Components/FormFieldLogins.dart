import 'package:flutter/material.dart';

class FormFieldLogins extends StatelessWidget {
  bool autofocus;
  String labelText;
  TextInputType keyboardType;
  FormFieldLogins({
    super.key,
    this.autofocus = false,
    required this.keyboardType,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
