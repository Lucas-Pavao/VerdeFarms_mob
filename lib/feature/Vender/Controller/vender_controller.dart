import 'package:flutter/material.dart';

import '../../../Services/feira_service.dart';
import '../../Login/Controllers/login_provider.dart';

class VenderController extends ChangeNotifier {
  final LoginProvider loginProvider;
  VenderController(this.loginProvider);

  late FeiraService feiraService = FeiraService(loginProvider);

  pegaFeira() {
    return feiraService.getAllFeira();
  }
}
