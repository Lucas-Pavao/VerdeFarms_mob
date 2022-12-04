import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/Screens/home_page.dart';
import '../Services/user_service.dart';
import '../constants/general_constants.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final RxBool keepUserLogged = true.obs;
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static late http.Response errorController;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    print("TextControllers removidos da memória.");
    super.onClose();
  }

  Future<void> performSignIn(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final response = await UserService.authUser(email, password);
        errorController = response;
        GeneralConstants.authUser = response;
        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          GeneralConstants.prefs.setString("token", json['access']);
          Get.snackbar("Sucesso!", "Login relizado com sucesso");
          Get.offAll(const HomePage());
        }
        if (response.statusCode == 401) {
          try {
            var json = jsonDecode(errorController.body);
            Get.snackbar("Atenção!", json['detail']);
            passwordController.clear();
          } catch (erro) {
            print(erro);
          }
        }
      } catch (e) {
        print(e);
      }
    } else {
      Get.snackbar('Error', "Preencha todos os campos");
    }
  }
}
