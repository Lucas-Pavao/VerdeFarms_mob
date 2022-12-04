import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../utils/http_exceptions.dart';

class HttpServices {
  static Future<http.Response> getData(String url) async {
    try {
      final response = await Backend.client.get(
        Uri.parse(url),
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

  static Future<http.Response> patchData(String url, dynamic body) async {
    try {
      final response = await Backend.client.patch(Uri.parse(url), body: body);
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
