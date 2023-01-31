import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/Model/autorizacao_model.dart';
import 'package:verde_farm/feature/Perfil/Model/user_model.dart';
import '../constants/api_constants.dart';
import '../feature/Login/Controllers/login_provider.dart';
import 'http_services.dart';

class UserService {
  final LoginProvider loginProvider;
  UserService(this.loginProvider);
  late HttpServices httpServices = HttpServices(loginProvider);
  // Por email
  Future<User?> getUserByEmail(String email) async {
    final response =
        await httpServices.getData("${Backend.usersURL}?search=$email");
    final json = jsonDecode(response);
    debugPrint(json.toString());
    return User.fromJson(json[0]);
  }

  Future<User?> getUserById(int id) async {
    final response =
        await httpServices.getData("${Backend.usersURL}/$id"); // Por ID
    final json = jsonDecode(response);
    debugPrint(json);
    return User.fromJson(json[0]);
  }

  Future<User?> postUser(User user) async {
    final response = await httpServices.postData(Backend.usersURL, user);
    final json = jsonDecode(response);
    return User.fromJson(json);
  }

  Future<User?> putUser(User user /*, int id*/) async {
    final response = await httpServices.putData(
        '${Backend.usersURL}${user.id}/', jsonEncode(user));
    final json = jsonDecode(response);
    return User.fromJson(json);
  }

  Future<Auth?> authUser(String email, String senha) async {
    final response = await httpServices.postData(
        Backend.loginURL, jsonEncode({"username": email, "password": senha}));
    final json = jsonDecode(response);
    return Auth.fromJson(json);
  }
}
