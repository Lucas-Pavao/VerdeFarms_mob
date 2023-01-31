import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/View/Components/form_field_logins.dart';
import 'package:verde_farm/feature/Login/Controllers/login_controller.dart';
import '../Controllers/login_provider.dart';
import 'Components/pass_form_field_logins.dart';
import '../../Cadastro/View/cadastro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController loginController = LoginController(widget.loginProvider);
  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network('https://i.imgur.com/plkT2Wt.png'),
                  FormFieldLogins(
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Email',
                    autofocus: true,
                    textController: loginController.emailController,
                  ),
                  const Divider(),
                  PassFormFieldLogins(
                    labelText: 'Senha',
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textEditingController: loginController.passwordController,
                  ),
                  const Divider(),
                  ElevatedButton(
                    onPressed: () {
                      loginController.performSignIn(context);
                    },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cadastro(
                                loginProvider: widget.loginProvider,
                              ),
                            ),
                          );
                        },
                        child: const Text('Cadastrar'))
                  ]),
                ]),
          ),
        ),
      ),
    );
  }
}
