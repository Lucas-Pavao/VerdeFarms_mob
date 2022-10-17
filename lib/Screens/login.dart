import 'package:flutter/material.dart';
import 'package:verde_farm/Components/FormFieldLogins.dart';

import '../Components/PassFormFieldLogins.dart';
import 'Cadastro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormFieldLogins(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email',
                  autofocus: true,
                ),
                const Divider(),
                PassFormFieldLogins(
                  labelText: 'Senha',
                  autofocus: true,
                  keyboardType: TextInputType.text,
                ),
                const Divider(),
                ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      elevation: 0,
                      // backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cadastro())),
                      child: const Text('Cadastrar'))
                ]),
              ]),
        ),
      ),
    );
  }
}
