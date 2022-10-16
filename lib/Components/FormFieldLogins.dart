import 'package:flutter/material.dart';

class FormFieldLogins extends StatelessWidget {
  bool autofocus;
  bool obscureText;
  String labelText;
  TextInputType keyboardType;
  FormFieldLogins({
    super.key,
    this.autofocus = false,
    this.obscureText = false,
    required this.keyboardType,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      obscureText: true,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
