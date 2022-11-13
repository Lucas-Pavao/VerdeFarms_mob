import 'package:flutter/material.dart';

class SnackBarError {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext context, String str) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.grey.shade200,
      content: Text(
        str,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!,
      ),
      duration: const Duration(seconds: 3),
    ));
  }
}
