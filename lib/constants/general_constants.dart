import '../models/autorizacao_model.dart';

class GeneralConstants {
  // static late SharedPreferences prefs;
  static AuthResponse? authUser;

  // void initSharedPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  // Future<void> checkLoggedUser() async {
  //   GeneralConstants.prefs = await SharedPreferences.getInstance();
  //   bool? isLoggedIn = prefs.getBool('isLoggedIn');
  //   print("Main onInit called: Logged user? $isLoggedIn");
  //   if (isLoggedIn == true) {
  //     String emailUser = prefs.getString('email')!;
  //     String passwordUser = prefs.getString('password')!;
  //     print(emailUser);
  //     print(passwordUser);
  //     final AuthResponse user =
  //         await UserService.authUser(emailUser, passwordUser);
  //     authUser = user;
  //     print("Usuário encontrado!");
  //   }
  // }
}
