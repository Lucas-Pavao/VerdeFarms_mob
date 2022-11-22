import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class GeneralConstants {
  static late SharedPreferences prefs;
  static http.Response? authUser;
  static RxBool isLoged = false.obs;

  void initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> checkLoggedUser() async {
    GeneralConstants.prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      isLoged(true);
    }
  }
}
