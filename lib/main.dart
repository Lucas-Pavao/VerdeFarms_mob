import 'package:flutter/material.dart';
import 'package:verde_farm/Screens/mapa.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
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
