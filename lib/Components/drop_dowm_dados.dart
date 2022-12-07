import 'package:flutter/material.dart';

import '../controllers/perfil_controller.dart';

class DropDowmDados extends StatefulWidget {
  const DropDowmDados({super.key});

  @override
  State<DropDowmDados> createState() => _DropDowmDadosState();
}

double weight = 50;

class _DropDowmDadosState extends State<DropDowmDados> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openContainer,
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: weight,
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
            if (weight == 50) ...[
              const SizedBox(width: 0, height: 0),
            ],
            if (weight == 200) ...[
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
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Email: ${PerfilController.email}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              )
            ],
          ]),
        ),
      ),
    );
  }

  openContainer() {
    setState(() {
      selected = !selected;
      if (weight == 50) {
        weight = 200;
      } else {
        weight = 50;
      }
    });
  }
}
