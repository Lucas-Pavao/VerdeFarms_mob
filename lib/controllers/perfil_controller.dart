import 'dart:convert';
import 'package:verde_farm/Services/user_service.dart';
import 'package:verde_farm/controllers/login_provider.dart';

class PerfilController {
  static String? firstName;
  static String? lastName;
  static String? username;
  static String? email;

  static loadPerfil() async {
    String? response = LoginProvider.prefs.getString('email');
    var infos = await UserService.getUser(response!);
    var json = jsonDecode(infos.body);
    firstName = json[0]['first_name'];
    lastName = json[0]['last_name'];
    username = json[0]['username'];
    email = json[0]['email'];
  }

  static Future<bool> sair() async {
    await LoginProvider.prefs.clear();
    LoginProvider.isLoged(false);
    return true;
  }
}
