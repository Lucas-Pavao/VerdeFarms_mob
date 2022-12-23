import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/Services/user_service.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import '../Model/user_model.dart';

class PerfilController {
  UserService userService = UserService();

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

  loadPerfil() async {
    String? pickedEmail = LoginProvider.prefs.getString('email');
    var infos = await userService.getUserByEmail(pickedEmail ?? '');
    id = infos?.id ?? -1;
    firstName = infos?.firstName ?? '';
    lastName = infos?.lastName ?? '';
    username = infos?.username ?? '';
    email = infos?.email ?? '';
  }

  editarDados(BuildContext context) async {
    String? pegaIdComEmail = LoginProvider.prefs.getString('email');
    var infos = await userService.getUserByEmail(pegaIdComEmail ?? '');
    id = infos?.id ?? -1;

    username = infos?.username ?? '';
    if (apelidoController.text.isNotEmpty) {
      username = apelidoController.text;
    }

    firstName = infos?.firstName ?? '';
    if (nomeController.text.isNotEmpty) {
      firstName = nomeController.text;
    }

    lastName = infos?.lastName ?? '';
    if (sobrenomeController.text.isNotEmpty) {
      lastName = sobrenomeController.text;
    }

    email = infos?.email ?? '';

    User user = User(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email);
    try {
      var response = await userService.putUser(user);
      debugPrint(response.toString());
      if (response != null) {
        Get.snackbar("Sucesso!", "Dados alterados com sucesso");
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    // debugPrint(response);
  }

  static Future<bool> sair() async {
    await LoginProvider.prefs.clear();
    LoginProvider.isLoged(false);
    return true;
  }
}
