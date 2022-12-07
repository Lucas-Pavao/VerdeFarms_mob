import 'package:http/http.dart' as http;

class Backend {
  static final http.Client client = http.Client();
  // 10.0.0.156
  static const String baseURL = "http://10.0.2.2:8000/api"; //Emulador
  // static const String baseURL = "http://127.0.0.1:8000/api/";
  static const String loginURL = "http://10.0.2.2:8000/token/"; //Emulador
  // static const String loginURL = "http://192.168.1.102:8000/token/";
  static const String registerURL = "$baseURL/register";
  static const String usersURL = "$baseURL/users/";
  static const String vendedorURL = "$baseURL/vendedor/";
  static const String localizacaoURL = "$baseURL/lozalizacao/";
  static const String fazendaURL = "$baseURL/fazenda/";
  static const String fazendaVendedorURL = "$baseURL/fazendaVendedor/";
  static const String produtoURL = "$baseURL/produto/";
  static const String produtoVendedorURL = "$baseURL/produtoVendedor/";
  static const String favoritoVendedorURL = "$baseURL/favoritoVendedor/";
  static const String favoritoProdutoURL = "$baseURL/favoritoProduto/";
  static const String feiraURL = "$baseURL/feira/";
}
