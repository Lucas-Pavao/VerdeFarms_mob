import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/controllers/perfil_controller.dart';

import 'mapa.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Container(
          child: ElevatedButton(
        onPressed: () async {
          bool saiu = await PerfilController.sair();
          if (saiu) {
            Get.off(Mapa());
          }
        },
        child: Text('Sair'),
      )),
    );
  }
}
