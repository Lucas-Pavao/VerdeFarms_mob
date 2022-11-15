import 'package:flutter/material.dart';
import '../Screens/cadastro.dart';
import '../Screens/login.dart';

class LoginNavBar extends StatelessWidget {
  const LoginNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
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
                        MaterialStateProperty.all<Color>(Colors.blueGrey)),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cadastro())),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey)),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage())),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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