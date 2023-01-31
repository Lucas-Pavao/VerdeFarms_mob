import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verde_farm/Services/user_service.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import '../Model/user_model.dart';

class PerfilController extends ChangeNotifier {
  final LoginProvider loginProvider;
  PerfilController(this.loginProvider);

  late UserService userService = UserService(loginProvider);

  int _id = 0;
  String _firstName = '';
  String _lastName = '';
  String _username = '';
  String _email = '';
  final TextEditingController apelidoController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get username => _username;
  String get email => _email;

  loadPerfil(BuildContext context) async {
    LoginProvider loginProvider = context.read<LoginProvider>();
    var infos = await userService.getUserByEmail(loginProvider.email);
    _id = infos?.id ?? -1;
    _firstName = infos?.firstName ?? '';
    _lastName = infos?.lastName ?? '';
    _username = infos?.username ?? '';
    _email = infos?.email ?? '';
    notifyListeners();
  }

  editarDados(BuildContext context) async {
    LoginProvider loginProvider = context.read<LoginProvider>();
    var infos = await userService.getUserByEmail(loginProvider.email);
    _id = infos?.id ?? -1;

    _username = infos?.username ?? '';
    if (apelidoController.text.isNotEmpty) {
      _username = apelidoController.text;
    }

    _firstName = infos?.firstName ?? '';
    if (nomeController.text.isNotEmpty) {
      _firstName = nomeController.text;
    }

    _lastName = infos?.lastName ?? '';
    if (sobrenomeController.text.isNotEmpty) {
      _lastName = sobrenomeController.text;
    }

    _email = infos?.email ?? '';

    User user = User(
        id: _id,
        username: _username,
        firstName: _firstName,
        lastName: _lastName,
        email: _email);
    try {
      var response = await userService.putUser(user);
      debugPrint(response.toString());
      if (response != null) {
        // Get.snackbar("Sucesso!", "Dados alterados com sucesso");
        notifyListeners();
        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    // debugPrint(response);
  }

  Future<bool> sair(BuildContext context) async {
    LoginProvider loginProvider = context.read<LoginProvider>();
    await loginProvider.prefs.clear();
    loginProvider.isLoged = false;
    return true;
  }
}
