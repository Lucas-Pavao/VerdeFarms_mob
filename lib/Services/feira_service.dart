import 'dart:convert';

import '../constants/api_constants.dart';
import '../feature/Vender/Model/feira_model.dart';
import 'http_services.dart';

class FeiraService {
  HttpServices httpServices = HttpServices();

  Future<Feira?> getFeira() async {
    final response = await httpServices.getData(Backend.feiraURL);
    final json = jsonDecode(response);
    return Feira.fromJson(json);
  }

  Future<Feira?> postFeira(Feira feira) async {
    final response = await httpServices.postData(Backend.feiraURL, feira);
    final json = jsonDecode(response);
    return Feira.fromJson(json);
  }
}
