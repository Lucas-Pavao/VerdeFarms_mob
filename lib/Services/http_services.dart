import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/apiConstants.dart';
import '../utils/http_exceptions.dart';

class HttpServices {
  static Future<String> getData(String url) async {
    try {
      final response = await Backend.client.get(
        Uri.parse(url),
      );
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  static Future<String> postData(String url, dynamic body) async {
    try {
      final response = await Backend.client.post(Uri.parse(url), body: body);
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  static Future<String> patchData(String url, dynamic body) async {
    try {
      final response = await Backend.client.patch(Uri.parse(url), body: body);
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  static Future<String> deleteData(String url) async {
    try {
      final response = await Backend.client.delete(
        Uri.parse(url),
      );
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  static String _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes));
      case 401:
      case 403:
        throw UnauthorizedException(utf8.decode(response.bodyBytes));
      case 428:
        throw InvalidEmailException("Email já associado a um usuário");
      case 500:
      default:
        throw FetchDataException(
            "Um erro inesperado ocorreu durante a comunicação com o servidor.");
    }
  }
}
