import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verde_farm/Screens/cadastro.dart';
import 'package:verde_farm/Screens/login.dart';
import 'package:verde_farm/Services/cadastro_service.dart';
import 'package:verde_farm/models/vendedor_model.dart';

class CadastroController {
  static final TextEditingController nomeController = TextEditingController();
  static final TextEditingController apelidoController =
      TextEditingController();
  static final TextEditingController cpfController = TextEditingController();
  static final TextEditingController usuarioController =
      TextEditingController();
  static final TextEditingController descricaoController =
      TextEditingController();
  static final TextEditingController senhaController = TextEditingController();
  static final TextEditingController confSenhaController =
      TextEditingController();

  static Future<void> cadastrar(BuildContext context) async {
    final String nome = nomeController.text;
    final String apelido = apelidoController.text;
    final String cpf = cpfController.text;
    final String usuario = usuarioController.text;
    final String descricao = descricaoController.text;
    final String senha = senhaController.text;
    final String confSenha = confSenhaController.text;

    if (nome.isNotEmpty &&
        apelido.isNotEmpty &&
        cpf.isNotEmpty &&
        usuario.isNotEmpty &&
        descricao.isNotEmpty &&
        senha.isNotEmpty &&
        confSenha.isNotEmpty) {
      Vendedor vendedor = Vendedor(
        nome: nome,
        apelido: apelido,
        cpf: cpf,
        usuario: usuario,
        descricao: descricao,
        senha: senha,
      );
      try {
        await CadastroServices.postCadastro(vendedor);
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (error) {
        print(error);
      }
    } else if (senha != confSenha) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Text(
          "As senhas não coincidem",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
        duration: const Duration(seconds: 3),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Text(
          "Todos os campos devem ser preenchidos",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
        duration: const Duration(seconds: 3),
      ));
    }
  }
}
