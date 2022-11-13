import 'package:flutter/material.dart';
import 'package:verde_farm/Components/FormFieldLogins.dart';
import 'package:verde_farm/Components/PassFormFieldLogins.dart';
import 'package:verde_farm/controllers/cadastro_controller.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    // https://i.imgur.com/plkT2Wt.png
                    Image.network('https://i.imgur.com/plkT2Wt.png'),
                    FormFieldLogins(
                        keyboardType: TextInputType.text,
                        labelText: 'Apelido',
                        textController: CadastroController.apelidoController),
                    FormFieldLogins(
                        keyboardType: TextInputType.text,
                        labelText: 'Nome',
                        textController: CadastroController.firstNameController),
                    FormFieldLogins(
                        keyboardType: TextInputType.text,
                        labelText: 'Sobrenome',
                        textController: CadastroController.lastNameController),
                    FormFieldLogins(
                      keyboardType: TextInputType.text,
                      labelText: 'Email',
                      textController: CadastroController.emailController,
                    ),
                    PassFormFieldLogins(
                      keyboardType: TextInputType.text,
                      labelText: 'Senha',
                      textEditingController: CadastroController.senhaController,
                    ),
                    PassFormFieldLogins(
                      keyboardType: TextInputType.text,
                      labelText: 'Confirmar senha',
                      textEditingController:
                          CadastroController.confSenhaController,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await CadastroController.cadastrar(context);
                },
                style: TextButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
