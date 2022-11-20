import 'package:flutter/material.dart';

class PassFormFieldLogins extends StatefulWidget {
  bool autofocus;
  bool isObscure;
  String labelText;
  final TextEditingController? textEditingController;
  TextInputType keyboardType;
  PassFormFieldLogins(
      {super.key,
      this.autofocus = false,
      this.isObscure = true,
      required this.keyboardType,
      required this.labelText,
      this.textEditingController});

  @override
  State<PassFormFieldLogins> createState() => _PassFormFieldLoginsState();
}

class _PassFormFieldLoginsState extends State<PassFormFieldLogins> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      autofocus: widget.autofocus,
      obscureText: _isObscure == true ? true : false,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            child: Icon(
                _isObscure == true ? Icons.visibility_off : Icons.visibility)),
      ),
    );
  }
}
