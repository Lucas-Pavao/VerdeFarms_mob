import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  late SharedPreferences prefs;
  http.Response? authUser;
  String _token = "";
  String _email = "";

  bool get isLoged => _token.isNotEmpty;

  set isLoged(bool value) {
    if (value == false) {
      token = "";
      email = "";
    }
    notifyListeners();
  }

  String get token => _token;

  set token(String value) {
    if (_token == value) return;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(('token'), value);
      debugPrint(prefs.getString('token'));
    });

    _token = value;
    notifyListeners();
  }

  String get email => _email;
  set email(String value) {
    if (_email == value) return;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(('email'), value);
    });

    _email = value;
    notifyListeners();
  }
  // initSharedPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  Future<void> recoverSavedToken() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      debugPrint(prefs.getString('token')!);
      token = prefs.getString('token')!;
    }
  }
}
