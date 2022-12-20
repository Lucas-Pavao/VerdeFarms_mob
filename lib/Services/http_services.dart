import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../feature/Login/Controllers/login_provider.dart';
import '../utils/http_exceptions.dart';

Map<String, String>? getHeaders() {
  final Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '${LoginProvider.token}',
  };
  return headers;
}

class HttpServices {
  static Future<http.Response> getData(String url) async {
    try {
      final response = await Backend.client.get(
        Uri.parse(url),
        headers: getHeaders(),
      );
      return response;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  static Future<http.Response> postData(String url, dynamic body) async {
    try {
      final response = await Backend.client.post(Uri.parse(url), body: body);
      print(response.statusCode);
      print(response.body);
      return response;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  static Future<http.Response> putData(String url, dynamic body) async {
    try {
      final response = await Backend.client.put(Uri.parse(url), body: body);
      print(response.body);
      return response;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  static Future<http.Response> deleteData(String url) async {
    try {
      final response = await Backend.client.delete(
        Uri.parse(url),
      );
      return response;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }
}
