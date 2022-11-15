import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:verde_farm/Components/SnackBarError.dart';
import 'package:verde_farm/Services/register_service.dart';
import 'package:verde_farm/controllers/models/register_model.dart';
import 'package:http/http.dart' as http;

import '../Screens/login.dart';

class CadastroController {
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
          SnackBarError()
              .showSnackBar(context, "Cadastro realizado com secesso");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
        } catch (errorController) {
          // {"username":["A user with that username already exists."],
          //"password":["This password is too short. It must contain at least 8 characters.","This password is too common.","This password is entirely numeric."],
          //"email":["This field must be unique."]}
          var json = jsonDecode(CadastroController.errorController.body);

          try {
            List usernameError = json['username'];
            for (var element in usernameError) {
              SnackBarError().showSnackBar(context, element);
            }
          } catch (userError) {
            print(userError);
          }

          try {
            List emailError = json['email'];
            for (var element in emailError) {
              SnackBarError().showSnackBar(context, element);
            }
          } catch (eError) {
            print(eError);
          }

          try {
            List passwordError = json['password'];
            for (var element in passwordError) {
              SnackBarError().showSnackBar(context, element);
            }
          } catch (passError) {
            print(passError);
          }
        }
      } else {
        SnackBarError().showSnackBar(context, "As senhas não coincidem!");
      }
    } else {
      SnackBarError()
          .showSnackBar(context, "Todos os campos devem ser preenchidos!");
    }
  }
}
