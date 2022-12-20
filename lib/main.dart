import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verde_farm/home_page.dart';
import 'package:verde_farm/feature/Mapa/View/mapa.dart';
import 'package:flutter_config/flutter_config.dart';

import 'feature/Login/Controllers/login_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();
  Future.delayed(
    const Duration(milliseconds: 100),
    () => LoginProvider.isLoged(),
  );
  runApp(const VerdeFarm());
}

class VerdeFarm extends StatelessWidget {
  const VerdeFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        primarySwatch: Colors.green,
      ),
      home: Obx(() {
        return LoginProvider.isLoged() ? const HomePage() : const Mapa();
      }),
    );
  }
}
