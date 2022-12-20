import 'package:verde_farm/Services/http_services.dart';
import 'package:verde_farm/constants/api_constants.dart';
import 'package:verde_farm/feature/Cadastro/Model/register_model.dart';

import '../feature/Cadastro/Controllers/cadastro_controller.dart';

class RegisterServices {
  // static Future<Register> getRegister() async {
  //   final response = await HttpServices.getData("${Backend.}/$id");
  //   return userFromJson(response);

  // }

  static Future<Register?> postRegister(Register register) async {
    final response = await HttpServices.postData(
      Backend.registerURL,
      {
        'username': register.username,
        'first_name': register.first_name,
        'last_name': register.last_name,
        'email': register.email,
        'password': register.password,
        'password2': register.password2,
      },
    );

    // print(response);
    CadastroController.errorController = response;
    return registerFromJason(response.body);
  }
}
