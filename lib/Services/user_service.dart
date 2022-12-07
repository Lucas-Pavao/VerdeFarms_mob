import 'package:verde_farm/models/user_model.dart';
import '../constants/api_constants.dart';
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

  static Future<User> postUser(User user) async {
    final response =
        await HttpServices.postData(Backend.usersURL, userToJason(user));
    return userFromJason(response.body);
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
