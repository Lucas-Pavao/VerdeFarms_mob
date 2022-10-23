import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  fetch();
}

fetch() async {
  var url = Uri.parse('https://swapi.dev/api/people/3');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);
    final name = jsonResponse['name'];
    print('resultado $name');
    print('resultado ${response.statusCode}');
  }
}
