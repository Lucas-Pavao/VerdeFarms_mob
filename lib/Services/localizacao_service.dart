import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import '../constants/api_constants.dart';
import '../feature/Mapa/Model/localizacao_model.dart';
import 'http_services.dart';

class LocalizacaoService {
  final LoginProvider loginProvider;
  LocalizacaoService(this.loginProvider);

  late HttpServices httpServices = HttpServices(loginProvider);

  Future<Localizacao?> getLocalizacao() async {
    final response = await httpServices.getData(Backend.localizacaoURL);
    final json = jsonDecode(response);
    debugPrint(json.toString());
    return json;
  }

  Future<List<dynamic>?> getAllLocalizacao() async {
    final response = await httpServices.getData(Backend.localizacaoURL);
    final json = jsonDecode(response);
    debugPrint(json.toString());
    return json;
  }

  Future<Localizacao?> postLocalizacao(Localizacao localizacao) async {
    final response = await httpServices.postData(
        Backend.localizacaoURL, jsonEncode(localizacao));
    debugPrint(response.toString());
    final json = jsonDecode(response);
    return Localizacao.fromJson(json);
  }

  Future<Localizacao?> deleteLocalizacao(int id) async {
    final response = await httpServices.deleteData(Backend.localizacaoURL, id);
    debugPrint(response.toString());
    final json = jsonDecode(response);
    return Localizacao.fromJson(json);
  }
}
