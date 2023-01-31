import 'dart:io';
import 'package:flutter/material.dart';
import '../constants/api_constants.dart';
import '../feature/Login/Controllers/login_provider.dart';
import '../utils/http_exceptions.dart';

class HttpServices {
  final LoginProvider loginProvider;
  HttpServices(this.loginProvider);

  Map<String, String>? getHeaders() {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${loginProvider.token}',
    };
    return headers;
  }

  Future<String> getData(String url) async {
    try {
      final response = await Backend.client.get(
        Uri.parse(url),
        headers: getHeaders(),
      );
      return response.body;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  Future<String> postData(String url, dynamic body) async {
    try {
      final response = await Backend.client
          .post(Uri.parse(url), body: body, headers: getHeaders());

      return response.body;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  Future<String> putData(String url, dynamic body) async {
    try {
      final response = await Backend.client
          .put(Uri.parse(url), body: body, headers: getHeaders());
      debugPrint(response.body);
      return response.body;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }

  Future<String> deleteData(String url, int id) async {
    try {
      final response = await Backend.client.delete(
        Uri.parse(url + "/$id"),
        headers: getHeaders(),
      );
      return response.body;
    } on SocketException {
      throw FetchDataException(
          "Falha ao conectar-se com o servidor. Verifique a sua conexão com a internet.");
    }
  }
}
