import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// [
//     {
//         "id": 1,
//         "usuario": "1",
//         "senha": "1",
//         "apelido": "luquinha",
//         "cpf": "61711072224",
//         "nome": "testando",
//         "descricao": "arroz ao molho"
//     }
// ]

class Vendedor {
  final int? id;
  final String? usuario;
  final String? senha;
  final String? apelido;
  final String? cpf;
  final String? nome;
  final String? descricao;
  Vendedor({
    this.id,
    this.usuario,
    this.senha,
    this.apelido,
    this.cpf,
    this.nome,
    this.descricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'usuario': usuario,
      'senha': senha,
      'apelido': apelido,
      'cpf': cpf,
      'nome': nome,
      'descricao': descricao,
    };
  }

  factory Vendedor.fromMap(Map<String, dynamic> map) {
    return Vendedor(
      id: map['id'] != null ? map['id'] as int : null,
      usuario: map['usuario'] != null ? map['usuario'] as String : null,
      senha: map['senha'] != null ? map['senha'] as String : null,
      apelido: map['apelido'] != null ? map['apelido'] as String : null,
      cpf: map['cpf'] != null ? map['cpf'] as String : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vendedor.fromJson(String source) =>
      Vendedor.fromMap(json.decode(source) as Map<String, dynamic>);
}
