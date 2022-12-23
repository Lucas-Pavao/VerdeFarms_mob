import 'dart:convert';
import 'dart:io';
import 'package:verde_farm/Services/http_services.dart';
import 'package:verde_farm/constants/api_constants.dart';
import 'package:verde_farm/feature/Cadastro/Model/register_model.dart';

import '../utils/http_exceptions.dart';

class RegisterServices {
  HttpServices httpServices = HttpServices();

  // static Future<Register> getRegister() async {
  //   final response = await HttpServices.getData("${Backend.}/$id");
  //   return userFromJson(response);

  // }

  Future<Register?> postRegister(Register register) async {
    // final response =
    //     await httpServices.postData(Backend.registerURL, register.toJson());
    // final json = jsonDecode(response);
    // // debugPrint(response);
    // // CadastroController.errorController = response;
    // return Register.fromJson(json);

    try {
      final response = await Backend.client
          .post(Uri.parse(Backend.registerURL), body: register.toJson());
      final json = jsonDecode(response.body);
      return Register.fromJson(json);
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }
}
