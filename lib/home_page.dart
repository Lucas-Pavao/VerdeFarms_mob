import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:verde_farm/feature/Favorito/View/favoritos.dart';
import 'package:verde_farm/feature/Mapa/View/mapa.dart';
import 'package:verde_farm/feature/Perfil/View/perfil.dart';
import 'package:verde_farm/feature/Vender/View/vendedor.dart';
import 'package:verde_farm/feature/Perfil/Controllers/perfil_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;
  PerfilController perfilController = PerfilController();

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
    Future.delayed(const Duration(milliseconds: 200), () async {
      await perfilController.loadPerfil();
      setState(() {});
    });
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
          activeColor: Colors.green[400],
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
              icon: Icons.favorite_border,
              text: 'Favoritos',
            ),
            GButton(
              icon: Icons.discount_outlined,
              text: 'Feiras',
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
