import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/Screens/mapa.dart';
import '../Services/user_service.dart';
import '../constants/general_constants.dart';
import '../models/autorizacao_model.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final RxBool keepUserLogged = true.obs;
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static late final http.Response errorController;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    print("TextControllers removidos da memória.");
    super.onClose();
  }

  static Future<void> performSignIn(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final AuthResponse response =
            await UserService.authUser(email, password);
        GeneralConstants.authUser = response;
        Get.to(const Mapa());
      } catch (e) {
        print(e);
        var json = jsonDecode(LoginController.errorController.body);
        try {
          List errorlog = json['detail'];
          for (var element in errorlog) {
            Get.snackbar("Atenção!", element);
          }
        } catch (erro) {
          print(erro);
        }
      }
    } else {
      Get.snackbar('Error', "Preencha todos os campos");
    }
  }
}
