import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/View/Components/form_field_logins.dart';
import 'package:verde_farm/feature/Login/View/Components/pass_form_field_logins.dart';
import 'package:verde_farm/feature/Cadastro/Controllers/cadastro_controller.dart';

import '../../Login/Controllers/login_provider.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  late CadastroController cadastroController =
      CadastroController(widget.loginProvider);
  @override
  void dispose() {
    super.dispose();
    cadastroController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // https://i.imgur.com/plkT2Wt.png
                Image.network('https://i.imgur.com/plkT2Wt.png'),
                FormFieldLogins(
                    keyboardType: TextInputType.text,
                    labelText: 'Apelido',
                    textController: cadastroController.apelidoController),
                FormFieldLogins(
                    keyboardType: TextInputType.text,
                    labelText: 'Nome',
                    textController: cadastroController.firstNameController),
                FormFieldLogins(
                    keyboardType: TextInputType.text,
                    labelText: 'Sobrenome',
                    textController: cadastroController.lastNameController),
                FormFieldLogins(
                  keyboardType: TextInputType.text,
                  labelText: 'Email',
                  textController: cadastroController.emailController,
                ),
                PassFormFieldLogins(
                  keyboardType: TextInputType.text,
                  labelText: 'Senha',
                  textEditingController: cadastroController.senhaController,
                ),
                PassFormFieldLogins(
                  keyboardType: TextInputType.text,
                  labelText: 'Confirmar senha',
                  textEditingController: cadastroController.confSenhaController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await cadastroController.cadastrar(context);
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
      ),
    );
  }
}
