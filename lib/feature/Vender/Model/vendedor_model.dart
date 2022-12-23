class Vendedor {
  int? id;
  String? usuario;
  String? senha;
  String? apelido;
  String? cpf;
  String? nome;
  String? descricao;

  Vendedor(
      {this.id,
      this.usuario,
      this.senha,
      this.apelido,
      this.cpf,
      this.nome,
      this.descricao});

  Vendedor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    senha = json['senha'];
    apelido = json['apelido'];
    cpf = json['cpf'];
    nome = json['nome'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['usuario'] = usuario;
    data['senha'] = senha;
    data['apelido'] = apelido;
    data['cpf'] = cpf;
    data['nome'] = nome;
    data['descricao'] = descricao;
    return data;
  }
}
