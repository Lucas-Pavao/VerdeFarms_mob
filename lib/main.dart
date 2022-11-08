import 'package:flutter/material.dart';
import 'package:verde_farm/Screens/mapa.dart';

main() {
  runApp(VerdeFarm());
}

class VerdeFarm extends StatelessWidget {
  const VerdeFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Mapa(),
    );
  }
}
