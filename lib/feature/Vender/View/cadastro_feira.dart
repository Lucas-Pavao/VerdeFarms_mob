import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:verde_farm/feature/Mapa/Controller/mapa_controller.dart';
import 'package:verde_farm/feature/Vender/Controller/cadastro_feira_controller.dart';
import 'package:verde_farm/home_page.dart';
import '../../Login/Controllers/login_provider.dart';
import 'components/cadastro_feira_modal.dart';

class CadastroFeira extends StatefulWidget {
  const CadastroFeira({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  State<CadastroFeira> createState() => _CadastroFeiraState();
}

class _CadastroFeiraState extends State<CadastroFeira> {
  late CadastroFeiraController cadastroFeiraController =
      CadastroFeiraController(widget.loginProvider);
  late MapaController mapaController = MapaController(widget.loginProvider);
  @override
  initState() {
    super.initState();
    cadastroFeiraController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Feira'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                elevation: 0,
                backgroundColor: Colors.white,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: CadastroFeiraModal(
                      onSaved: (nomeFeira) {
                        cadastroFeiraController.cadastrarFeira(nomeFeira);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                HomePage(loginProvider: widget.loginProvider)));
                      },
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: cadastroFeiraController,
        builder: (context, child) => Consumer<LoginProvider>(
          builder: (context, loginProvider, child) => Scaffold(
            backgroundColor: Colors.white,
            body: GoogleMap(
              compassEnabled: true,
              mapToolbarEnabled: false,
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: cadastroFeiraController.position,
                zoom: 13,
              ),
              onTap: cadastroFeiraController.onMapClicked,
              markers: cadastroFeiraController.markers,
              // markers: controller.markers,
              onMapCreated: (gmc) =>
                  cadastroFeiraController.onMapCreated(gmc, loginProvider),
            ),
          ),
        ),
      ),
    );
  }
}
