import 'package:flutter/material.dart';

class FormFieldLogins extends StatelessWidget {
  final bool autofocus;
  final String labelText;
  final TextEditingController? textController;
  final TextInputType keyboardType;
  FormFieldLogins({
    super.key,
    this.autofocus = false,
    required this.keyboardType,
    required this.labelText,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      keyboardType: keyboardType,
      controller: textController,
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
