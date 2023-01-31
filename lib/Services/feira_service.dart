import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import '../constants/api_constants.dart';
import '../feature/Vender/Model/feira_model.dart';
import 'http_services.dart';

class FeiraService {
  final LoginProvider loginProvider;
  FeiraService(this.loginProvider);

  late HttpServices httpServices = HttpServices(loginProvider);

  Future<Feira?> getFeira() async {
    final response = await httpServices.getData(Backend.feiraURL);
    final json = jsonDecode(response);
    debugPrint(json.toString());
    return json;
  }

  Future<List<Feira>> getAllFeira() async {
    final response = await httpServices.getData(Backend.feiraURL);
    List json = jsonDecode(response);
    debugPrint(json.toString());
    return json.map((e) => Feira.fromJson(e)).toList();
    // return json;
  }

  Future<Feira?> postFeira(Feira feira) async {
    final response =
        await httpServices.postData(Backend.feiraURL, jsonEncode(feira));
    debugPrint(response.toString());
    final json = jsonDecode(response);
    return Feira.fromJson(json);
  }
}
