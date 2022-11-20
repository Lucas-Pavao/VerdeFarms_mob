import 'package:flutter/material.dart';

class FormFieldLogins extends StatefulWidget {
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
  State<FormFieldLogins> createState() => _FormFieldLoginsState();
}

class _FormFieldLoginsState extends State<FormFieldLogins> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      controller: widget.textController,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
