import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verde_farm/home_page.dart';
import '../../../Services/user_service.dart';
import 'package:http/http.dart' as http;

import 'login_provider.dart';

class LoginController {
  final LoginProvider loginProvider;
  LoginController(this.loginProvider);
  late UserService userService = UserService(loginProvider);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late http.Response errorController;
  //  final String email = emailController.text;
  //  final String password = passwordController.text;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // debugPrint("TextControllers removidos da memória.");
  }

  Future<void> performSignIn(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        userService.authUser(email, password).then((response) {
          debugPrint(response.toString());
          LoginProvider loginProvider = context.read<LoginProvider>();
          loginProvider.email = email;
          loginProvider.token = response?.access ?? "";
          // Get.snackbar("Sucesso!", "Login relizado com sucesso");
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(loginProvider: loginProvider),
          ));
        });

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
      // Get.snackbar('Error', "Preencha todos os campos");
    }
  }
}
