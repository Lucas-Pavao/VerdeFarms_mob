import 'package:get/get.dart';
import 'package:verde_farm/constants/general_constants.dart';

class PerfilController extends GetxController {
  static PerfilController get to => Get.find<PerfilController>();

  static Future<bool> sair() async {
    await GeneralConstants.prefs.clear();
    GeneralConstants.isLoged(false);
    return true;
  }
}
