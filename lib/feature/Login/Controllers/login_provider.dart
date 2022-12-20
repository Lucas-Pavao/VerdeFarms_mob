import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginProvider {
  static late SharedPreferences prefs;
  static http.Response? authUser;
  static RxBool isLoged = false.obs;
  static String? token;

  // initSharedPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  static Future<void> checkLoggedUser() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      token = prefs.getString('token')!;
      isLoged(true);
    }
  }
}
