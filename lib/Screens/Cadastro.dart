import 'package:flutter/material.dart';
import 'package:verde_farm/Components/FormFieldLogins.dart';
import 'package:verde_farm/Components/PassFormFieldLogins.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  FormFieldLogins(
                      keyboardType: TextInputType.text, labelText: 'Nome'),
                  FormFieldLogins(
                      keyboardType: TextInputType.text, labelText: 'Sobrenome'),
                  FormFieldLogins(
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email'),
                  PassFormFieldLogins(
                      keyboardType: TextInputType.text, labelText: 'Senha'),
                  PassFormFieldLogins(
                      keyboardType: TextInputType.text,
                      labelText: 'Confirmar senha'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(
                'Cadastrar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
