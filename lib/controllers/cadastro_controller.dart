import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/Services/register_service.dart';
import 'package:verde_farm/models/register_model.dart';

class CadastroController {
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController senhaController = TextEditingController();
  static final TextEditingController confSenhaController =
      TextEditingController();

  static Future<void> cadastrar(BuildContext context) async {
    final String nome = firstNameController.text;
    final String sobrenome = lastNameController.text;
    final String email = emailController.text;
    final String senha = senhaController.text;
    final String confSenha = confSenhaController.text;

    if (nome.isNotEmpty &&
        sobrenome.isNotEmpty &&
        email.isNotEmpty &&
        senha.isNotEmpty &&
        confSenha.isNotEmpty) {
      if (senha == confSenha) {
        Register register = Register(
          first_name: nome,
          last_name: sobrenome,
          email: email,
          password: senha,
          password2: confSenha,
          username: "${nome}_$sobrenome",
        );
        try {
          await RegisterServices.postRegister(register);

          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => LoginPage()));
        } catch (error) {
          print(error);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey.shade200,
          content: Text(
            "As senhas não coincidem",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
          duration: const Duration(seconds: 3),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Text(
          "Todos os campos devem ser preenchidos",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
        duration: const Duration(seconds: 3),
      ));
    }

    // errorMessage(Register error) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     backgroundColor: Colors.grey.shade200,
    //     content: Text(
    //       '${error.printError()}',
    //       textAlign: TextAlign.center,
    //       style: Theme.of(context).textTheme.bodyLarge!,
    //     ),
    //     duration: const Duration(seconds: 3),
    //   ));
    // }
  }
}
