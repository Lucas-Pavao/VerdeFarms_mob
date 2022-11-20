import 'package:verde_farm/Services/http_services.dart';
import 'package:verde_farm/constants/apiConstants.dart';
import 'package:verde_farm/models/register_model.dart';

import '../controllers/cadastro_controller.dart';

// void main() {
//   RegisterServices.postRegister(Register(
//       username: 'Lazaro',
//       first_name: '100101010',
//       last_name: 'Apenas mais um teste',
//       email: 'Lazaro Ramos',
//       password: '101010',
//       password2: 'vendedor'));
// }

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
