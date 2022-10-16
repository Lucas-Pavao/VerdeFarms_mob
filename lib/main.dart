import 'package:flutter/material.dart';

import 'Screens/login.dart';

main() {
  runApp(VerdeFarm());
}

class VerdeFarm extends StatelessWidget {
  const VerdeFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
