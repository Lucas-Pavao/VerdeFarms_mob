import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/feature/Perfil/View/drop_dowm_dados.dart';
import 'package:verde_farm/feature/Perfil/Controllers/perfil_controller.dart';

import '../../Mapa/View/mapa.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                bottom: -35,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.grey[600],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -10,
                      child: GestureDetector(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.green[900],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    '${PerfilController.username}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: const [
                DropDowmDados(),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              bool saiu = await PerfilController.sair();
              if (saiu) {
                Get.off(const Mapa());
              }
            },
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}
