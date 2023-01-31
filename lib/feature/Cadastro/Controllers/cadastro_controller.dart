import 'package:flutter/material.dart';
import 'package:verde_farm/Services/register_service.dart';
import 'package:verde_farm/feature/Cadastro/Model/register_model.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import '../../Login/View/login.dart';

class CadastroController {
  final LoginProvider loginProvider;
  CadastroController(this.loginProvider);

  late RegisterServices registerServices = RegisterServices(loginProvider);

  final TextEditingController apelidoController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confSenhaController = TextEditingController();

  dispose() {
    apelidoController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confSenhaController.dispose();
  }

  Future<void> cadastrar(BuildContext context) async {
    final String apelido = apelidoController.text;
    final String nome = firstNameController.text;
    final String sobrenome = lastNameController.text;
    final String email = emailController.text;
    final String senha = senhaController.text;
    final String confSenha = confSenhaController.text;

    if (apelido.isNotEmpty &&
        nome.isNotEmpty &&
        sobrenome.isNotEmpty &&
        email.isNotEmpty &&
        senha.isNotEmpty &&
        confSenha.isNotEmpty) {
      if (senha == confSenha) {
        Register register = Register(
          firstName: nome,
          lastName: sobrenome,
          email: email,
          password: senha,
          password2: confSenha,
          username: apelido,
        );
        try {
          registerServices.postRegister(register);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginPage(
                    loginProvider: loginProvider,
                  )));
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => const LoginPage()));
        } catch (e) {
          debugPrint(e.toString());

          //   try {
          //     List usernameError = json['username'];
          //     for (var element in usernameError) {
          //       Get.snackbar("Atenção!", element);
          //     }
          //   } catch (erro) {
          //     debugPrint(erro.toString());
          //   }

          //   try {
          //     List emailError = json['email'];
          //     for (var element in emailError) {
          //       Get.snackbar("Atenção!", element);
          //     }
          //   } catch (erro) {
          //     debugPrint(erro.toString());
          //   }

          //   try {
          //     List passwordError = json['password'];
          //     for (var element in passwordError) {
          //       Get.snackbar("Atenção!", element);
          //     }
          //   } catch (error) {
          //     debugPrint(error.toString());
          //   }
        }
      } else {
        // Get.snackbar("Atenção!", "As senhas não coincidem!");
      }
    } else {
      // Get.snackbar("Atenção!", "Todos os campos devem ser preenchidos!");
    }
  }
}
