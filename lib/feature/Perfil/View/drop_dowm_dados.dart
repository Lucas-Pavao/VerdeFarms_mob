import 'package:flutter/material.dart';

import '../Controllers/perfil_controller.dart';
import 'editar_dados_modal.dart';

class DropDowmDados extends StatefulWidget {
  const DropDowmDados({super.key});

  @override
  State<DropDowmDados> createState() => _DropDowmDadosState();
}

double height = 50;

class _DropDowmDadosState extends State<DropDowmDados> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openContainer,
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: height,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text(
                    'Seus Dados',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: openContainer,
                    icon: Icon(
                      selected
                          ? Icons.arrow_drop_up_sharp
                          : Icons.arrow_drop_down_sharp,
                      size: 40,
                    ))
              ],
            ),
            if (height == 50) ...[
              const SizedBox(width: 0, height: 0),
            ],
            if (height == 200) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Text(
                        'Nome: ${PerfilController.firstName} ${PerfilController.lastName}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        'Email: ${PerfilController.email}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15))),
                          builder: (BuildContext context) {
                            return const SingleChildScrollView(
                                child: EditarDadosModal());
                          },
                          context: context,
                        );
                      },
                      child: const Text(
                        'Editar Dados',
                        style: TextStyle(fontSize: 16),
                      )),
                ],
              ),
            ],
          ]),
        ),
      ),
    );
  }

  openContainer() {
    setState(() {
      selected = !selected;
      if (height == 50) {
        height = 200;
      } else {
        height = 50;
      }
    });
  }
}
