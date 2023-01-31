import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verde_farm/home_page.dart';
import 'package:verde_farm/feature/Mapa/View/mapa.dart';
import 'package:flutter_config/flutter_config.dart';
import 'feature/Login/Controllers/login_provider.dart';
import 'feature/Vender/Controller/cadastro_feira_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  runApp(const VerdeFarm());
}

class VerdeFarm extends StatelessWidget {
  const VerdeFarm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        // ChangeNotifierProvider(
        //     create: (_) =>
        //         CadastroFeiraController(context.read<LoginProvider>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          primarySwatch: Colors.green,
        ),
        home: const App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<LoginProvider>().recoverSavedToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      return loginProvider.isLoged
          ? HomePage(
              loginProvider: loginProvider,
            )
          : Mapa(
              loginProvider: loginProvider,
            );
    });
  }
}
