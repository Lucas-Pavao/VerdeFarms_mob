import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:verde_farm/feature/Vender/View/cadastro_feira.dart';

class Vendedor extends StatefulWidget {
  const Vendedor({super.key});

  @override
  State<Vendedor> createState() => _VendedorState();
}

class _VendedorState extends State<Vendedor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Feiras",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroFeira(),
                      ),
                    );
                  },
                  child: Text('Cadastrar Feira'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
