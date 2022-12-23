import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/home_page.dart';
import '../../../Services/user_service.dart';
import 'package:http/http.dart' as http;

import 'login_provider.dart';

class LoginController extends GetxController {
  UserService userService = UserService();

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static late http.Response errorController;
  static final String email = emailController.text;
  static final String password = passwordController.text;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    // debugPrint("TextControllers removidos da memória.");
    super.onClose();
  }

  Future<void> performSignIn(BuildContext context) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await userService.authUser(email, password);
        debugPrint(response.toString());
        LoginProvider.prefs.setString("email", email);
        LoginProvider.token = response?.access ?? "";
        LoginProvider.prefs.setString("token", response?.access ?? "");
        Get.snackbar("Sucesso!", "Login relizado com sucesso");
        Get.offAll(const HomePage());

        // if (response.statusCode == 200) {
        //   var json = jsonDecode(response.body);
        // }
        // if (response.statusCode == 401) {
        //   try {
        //     var json = jsonDecode(errorController.body);
        //     Get.snackbar("Atenção!", json['detail']);
        //     passwordController.clear();
        //   } catch (erro) {
        //     debugPrint(erro);
        //   }
        // }
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      Get.snackbar('Error', "Preencha todos os campos");
    }
  }
}
