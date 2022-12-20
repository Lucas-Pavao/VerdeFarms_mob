import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/Services/user_service.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';

import '../Model/user_model.dart';

class PerfilController {
  static int id = 0;
  static String? firstName;
  static String? lastName;
  static String? username;
  static String? email;
  static final TextEditingController apelidoController =
      TextEditingController();
  static final TextEditingController nomeController = TextEditingController();
  static final TextEditingController sobrenomeController =
      TextEditingController();

  static loadPerfil() async {
    String? response = LoginProvider.prefs.getString('email');
    var infos = await UserService.getUser(response!);
    var json = jsonDecode(infos.body);
    // print(json);
    id = json[0]['id'];
    firstName = json[0]['first_name'];
    lastName = json[0]['last_name'];
    username = json[0]['username'];
    email = json[0]['email'];
  }

  static editarDados(BuildContext context) async {
    String? pegaID = LoginProvider.prefs.getString('email');
    var infos = await UserService.getUser(pegaID!);
    var json = jsonDecode(infos.body);
    // print(json);
    id = json[0]['id'];
    username = json[0]['username'];
    if (apelidoController.text.isNotEmpty) {
      username = apelidoController.text;
    }
    var firstName = json[0]['first_name'];
    if (nomeController.text.isNotEmpty) {
      firstName = nomeController.text;
    }
    var lastName = json[0]['last_name'];
    if (sobrenomeController.text.isNotEmpty) {
      lastName = sobrenomeController.text;
    }
    var response = await UserService.putUser(
      User(
        username: username,
        first_name: firstName,
        last_name: lastName,
      ),
    );
    if (response.statusCode == 200) {
      Get.snackbar("Sucesso!", "Dados alterados com sucesso");

      Navigator.pop(context);
    }
    print(response.body);
  }

  static Future<bool> sair() async {
    await LoginProvider.prefs.clear();
    LoginProvider.isLoged(false);
    return true;
  }
}
