import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/feature/Login/View/Components/form_field_logins.dart';
import 'package:verde_farm/feature/Login/Controllers/login_controller.dart';
import 'Components/pass_form_field_logins.dart';
import '../../Cadastro/View/cadastro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // @override
  // void dispose() {
  //
  //   super.dispose();
  //   LoginController.emailController.dispose();
  //   LoginController.passwordController.dispose();
  // }

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
                    textController: LoginController.emailController,
                  ),
                  const Divider(),
                  PassFormFieldLogins(
                    labelText: 'Senha',
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    textEditingController: LoginController.passwordController,
                  ),
                  const Divider(),
                  ElevatedButton(
                    onPressed: () async {
                      LoginController loginController = LoginController();
                      await loginController.performSignIn(context);
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
                          Get.to(const Cadastro());
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
