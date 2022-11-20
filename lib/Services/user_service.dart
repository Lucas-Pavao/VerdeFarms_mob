import 'dart:convert';

import 'package:verde_farm/controllers/login_controller.dart';
import 'package:verde_farm/models/user_model.dart';

import '../constants/apiConstants.dart';
import '../models/autorizacao_model.dart';
import 'http_services.dart';

void main() {
  UserService.getUser(2);
}

// {"id":2,"first_name":"Lucas","last_name":"Pavão","username":"Lucas_Pavão","email":"lhfp@gmail.com"}

class UserService {
  static Future<User> getUser(int id) async {
    final response = await HttpServices.getData("${Backend.usersURL}/$id");
    print(response.body);
    return userFromJason(response.body);
  }

  static Future<User> postUser(User user) async {
    final response =
        await HttpServices.postData(Backend.usersURL, userToJason(user));
    return userFromJason(response.body);
  }

  // static Future<User> deleteUser() async {
  //   final response = await HttpServices.deleteData("${Backend.usersURL}/${GeneralConstants.authUser?.usuarioDto?.id}");
  //   return userFromJason(response.body);
  // }

  static Future<AuthResponse> authUser(String email, String senha) async {
    final response = await HttpServices.postData(
        Backend.loginURL, {"username": email, "password": senha});
    LoginController.errorController = response;
    return authResponseFromJason(response.body);
  }
}
