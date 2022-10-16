import 'package:flutter/material.dart';
import 'package:verde_farm/Components/FormFieldLogins.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormFieldLogins(
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Emai',
                  autofocus: true,
                ),
                const Divider(),
                FormFieldLogins(
                  labelText: 'Senha',
                  obscureText: true,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                ),
                const Divider(),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Entrar',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  style: TextButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ]),
        ),
      ),
    );
  }
}
