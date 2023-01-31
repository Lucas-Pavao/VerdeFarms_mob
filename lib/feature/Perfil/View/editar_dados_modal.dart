import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import '../Controllers/perfil_controller.dart';

class EditarDadosModal extends StatefulWidget {
  const EditarDadosModal({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  State<EditarDadosModal> createState() => _EditarDadosModalState();
}

class _EditarDadosModalState extends State<EditarDadosModal> {
  late PerfilController perfilController =
      PerfilController(widget.loginProvider);
  double height = 50;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedContainer(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: verifyKeyBoard() ? height : height,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOutCubic,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Editar Dados',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              Column(
                children: [
                  TextFormField(
                    controller: perfilController.apelidoController,
                    decoration: const InputDecoration(
                      labelText: 'Apelido',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: perfilController.nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: perfilController.sobrenomeController,
                    decoration: const InputDecoration(
                      labelText: 'Sobrenome',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async =>
                          await perfilController.editarDados(context),
                      child: const Text('Salvar Alterações')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool verifyKeyBoard() {
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.5;
      });
      return false;
    } else {
      setState(() {
        height = MediaQuery.of(context).size.height * 0.8;
      });
      return false;
    }
  }
}
