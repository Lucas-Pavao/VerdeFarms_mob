import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verde_farm/feature/Vender/Controller/cadastro_feira_controller.dart';
import '../../Mapa/Controller/mapa_controller.dart';
import 'cadastro_feira_modal.dart';

class CadastroFeira extends StatefulWidget {
  const CadastroFeira({super.key});

  @override
  State<CadastroFeira> createState() => _CadastroFeiraState();
}

class _CadastroFeiraState extends State<CadastroFeira> {
  get controller => Get.put(MapaController());
  CadastroFeiraController cadastroFeiraController = CadastroFeiraController();
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
                backgroundColor: Colors.white,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                context: context,
                builder: (BuildContext context) {
                  return const SingleChildScrollView(
                      child: CadastroFeiraModal());
                },
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        compassEnabled: true,
        mapToolbarEnabled: false,
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: controller.position,
          zoom: 13,
        ),
        onTap: cadastroFeiraController.onTap,
        markers: CadastroFeiraController.markers.map((e) => e).toSet(),
        onMapCreated: controller.onMapCreated,
      ),
    );
  }
}
