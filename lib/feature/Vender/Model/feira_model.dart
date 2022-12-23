// {
//     "id": 1,
//     "nome": "alou",
//     "latitude": "0.00000",
//     "longitude": "0.00000"
// }

class Feira {
  int? id;
  String? nome;
  double? latitude;
  double? longitude;

  Feira({this.id, this.nome, this.latitude, this.longitude});

  Feira.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
