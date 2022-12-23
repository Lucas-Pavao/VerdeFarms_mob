// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:verde_farm/constants/api_constants.dart';
import 'package:verde_farm/feature/Vender/Model/vendedor_model.dart';

// void main() {
//   VEndedorServices.postCadastro(Vendedor(
//       apelido: 'Lazaro',
//       cpf: '100101010',
//       descricao: 'Apenas mais um teste',
//       nome: 'Lazaro Ramos',
//       senha: '101010',
//       usuario: 'vendedor'));
// }

class VendedorServices {
  static Future<Vendedor> getVEndedor(id) async {
    var response = await http.get(Uri.parse("${Backend.vendedorURL}$id"));
    var json = jsonDecode(response.body);
    var vendedor = Vendedor.fromJson(json);
    return vendedor;
  }

  static Future<Vendedor?> postVEndedor(Vendedor vendedor) async {
    var response =
        await http.post(Uri.parse(Backend.vendedorURL), body: vendedor);
    // if (response.statusCode == 201) {
    //   debugPrint(response.statusCode);
    //   debugPrint(response.body);
    final json = jsonDecode(response.body);
    return Vendedor.fromJson(json);
    //   debugPrint(response.statusCode);
    //   return null;
    // }
  }
}
