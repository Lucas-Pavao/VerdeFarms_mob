import 'package:verde_farm/feature/Perfil/View/perfil.dart';
import 'package:verde_farm/feature/Perfil/Model/user_model.dart';
import '../constants/api_constants.dart';
import '../feature/Login/Controllers/login_controller.dart';
import '../feature/Perfil/Controllers/perfil_controller.dart';
import 'http_services.dart';
import 'package:http/http.dart' as http;

// void main() {
//   print(UserService.getUser(1));
// }

class UserService {
  static Future<http.Response> getUser(String email) async {
    // Por email
    final response =
        await HttpServices.getData("${Backend.usersURL}?search=$email");
    // print(response.body);
    return response;
  }

  // static Future<User> getUser(int id) async {
  //   final response = await HttpServices.getData("${Backend.usersURL}/$id"); // Por ID
  //   print(response.body);
  //   return userFromJason(response.body);
  // }

  static Future<String> postUser(User user) async {
    final response = await HttpServices.postData(
      Backend.usersURL,
      {
        'username': user.username,
        'first_name': user.first_name,
        'last_name': user.last_name,
      },
    );
    return response.body;
  }

  static Future<http.Response> putUser(User user) async {
    final response = await HttpServices.putData(
      '${Backend.usersURL}${PerfilController.id}/',
      {
        'username': user.username,
        'first_name': user.first_name,
        'last_name': user.last_name,
      },
    );
    return response;
  }

  // static Future<User> deleteUser() async {
  //   final response = await HttpServices.deleteData("${Backend.usersURL}/${GeneralConstants.authUser?.usuarioDto?.id}");
  //   return userFromJason(response.body);
  // }

  static Future<http.Response> authUser(String email, String senha) async {
    final response = await HttpServices.postData(
        Backend.loginURL, {"username": email, "password": senha});
    return response;
  }
}
