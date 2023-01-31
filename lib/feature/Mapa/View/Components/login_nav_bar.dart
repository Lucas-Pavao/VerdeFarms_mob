import 'package:flutter/material.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import '../../../Cadastro/View/cadastro.dart';
import '../../../Login/View/login.dart';

class LoginNavBar extends StatelessWidget {
  const LoginNavBar({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cadastro(
                                loginProvider: loginProvider,
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.account_circle),
                    Text('Cadastrar'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(
                                loginProvider: loginProvider,
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.login),
                    Text('Login'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
