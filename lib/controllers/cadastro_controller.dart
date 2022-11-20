import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/Services/register_service.dart';
import 'package:verde_farm/models/register_model.dart';
import 'package:http/http.dart' as http;

import '../Screens/login.dart';

class CadastroController extends GetxController {
  static CadastroController get to => Get.find<CadastroController>();

  static final TextEditingController apelidoController =
      TextEditingController();
  static final TextEditingController firstNameController =
      TextEditingController();
  static final TextEditingController lastNameController =
      TextEditingController();
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController senhaController = TextEditingController();
  static final TextEditingController confSenhaController =
      TextEditingController();
  static late final http.Response errorController;

  @override
  void onClose() {
    apelidoController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confSenhaController.dispose();
    print("TextControllers removidos da memória.");
    super.onClose();
  }

  static Future<void> cadastrar(BuildContext context) async {
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
          first_name: nome,
          last_name: sobrenome,
          email: email,
          password: senha,
          password2: confSenha,
          username: apelido,
        );
        try {
          await RegisterServices.postRegister(register);
          Get.snackbar("Sucesso!", "Cadastro realizado com secesso!");
          Get.to(const LoginPage());
        } catch (e) {
          print(e);
          // {"username":["A user with that username already exists."],
          //"password":["This password is too short. It must contain at least 8 characters.","This password is too common.","This password is entirely numeric."],
          //"email":["This field must be unique."]}
          var json = jsonDecode(CadastroController.errorController.body);

          try {
            List usernameError = json['username'];
            for (var element in usernameError) {
              Get.snackbar("Atenção!", element);
            }
          } catch (erro) {
            print(erro);
          }

          try {
            List emailError = json['email'];
            for (var element in emailError) {
              Get.snackbar("Atenção!", element);
            }
          } catch (erro) {
            print(erro);
          }

          try {
            List passwordError = json['password'];
            for (var element in passwordError) {
              Get.snackbar("Atenção!", element);
            }
          } catch (error) {
            print(error);
          }
        }
      } else {
        Get.snackbar("Atenção!", "As senhas não coincidem!");
      }
    } else {
      Get.snackbar("Atenção!", "Todos os campos devem ser preenchidos!");
    }
  }
}
