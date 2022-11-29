import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/Screens/mapa.dart';
import 'package:flutter_config/flutter_config.dart';

import 'constants/general_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  GeneralConstants generalConstants = GeneralConstants();
  await generalConstants.initSharedPrefs();
  runApp(const VerdeFarm());
}

class VerdeFarm extends StatelessWidget {
  const VerdeFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Mapa(),
    );
  }
}
