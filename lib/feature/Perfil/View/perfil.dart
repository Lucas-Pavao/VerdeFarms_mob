import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';

import 'package:verde_farm/feature/Perfil/Controllers/perfil_controller.dart';
import '../../Mapa/View/mapa.dart';
import 'components/drop_dowm_dados.dart';
import 'components/perfil_photo.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late PerfilController perfilController =
      PerfilController(widget.loginProvider);
  @override
  void initState() {
    super.initState();
    perfilController.loadPerfil(context);
    perfilController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: perfilController,
      builder: (context, child) => Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PerfilPhoto(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    perfilController.username,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                DropDowmDados(loginProvider: widget.loginProvider),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              bool saiu = await perfilController.sair(context);
              if (saiu) {
                // Get.off(const Mapa());
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Mapa(
                              loginProvider: widget.loginProvider,
                            )));
              }
            },
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}
