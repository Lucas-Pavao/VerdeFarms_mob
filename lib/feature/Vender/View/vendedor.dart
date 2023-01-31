import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import 'package:verde_farm/feature/Vender/Controller/vender_controller.dart';
import 'package:verde_farm/feature/Vender/View/cadastro_feira.dart';

import '../Model/feira_model.dart';

class Vendedor extends StatefulWidget {
  const Vendedor({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  State<Vendedor> createState() => _VendedorState();
}

class _VendedorState extends State<Vendedor> {
  late VenderController venderController =
      VenderController(widget.loginProvider);

  late Future<List<Feira>> feiras;

  @override
  void initState() {
    super.initState();
    feiras = venderController.pegaFeira();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const SafeArea(
          //   child: SizedBox(
          //     height: 10,
          //   ),
          // ),
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
                        builder: (context) =>
                            CadastroFeira(loginProvider: widget.loginProvider),
                      ),
                    );
                  },
                  child: const Text('Cadastrar Feira'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: FutureBuilder<List<Feira>>(
              future: feiras,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Feira feira = snapshot.data![index];
                        return ListTile(
                          title: Text(feira.nome ?? ''),
                        );
                      });
                } else if (snapshot.hasError) {
                  return const Text('Erro ao carregar');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
