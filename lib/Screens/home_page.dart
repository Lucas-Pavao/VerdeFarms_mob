import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:verde_farm/Screens/favoritos.dart';
import 'package:verde_farm/Screens/mapa.dart';
import 'package:verde_farm/Screens/perfil.dart';
import 'package:verde_farm/Screens/vendedor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    // TODO: implement initState
    pc = PageController(initialPage: paginaAtual);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: const [Mapa(), Favoritos(), Vendedor(), Perfil()],
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.lightGreenAccent[400],
          selectedIndex: paginaAtual,
          onTabChange: (value) => {
            pc.animateToPage(value,
                duration: const Duration(milliseconds: 400), curve: Curves.ease)
          },
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favoritos',
            ),
            GButton(
              icon: Icons.discount_outlined,
              text: 'Vender',
            ),
            GButton(
              icon: Icons.account_circle_outlined,
              text: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
