import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../Mapa/Controller/mapa_controller.dart';
import 'cadastro_feira_modal.dart';

class CadastroFeira extends StatefulWidget {
  const CadastroFeira({super.key});

  @override
  State<CadastroFeira> createState() => _CadastroFeiraState();
}

class _CadastroFeiraState extends State<CadastroFeira> {
  get controller => Get.put(MapaController());
  final List<Marker> markers = [];

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
        onTap: onTap,
        markers: markers.map((e) => e).toSet(),
        onMapCreated: controller.onMapCreated,
      ),
    );
  }

  onTap(LatLng latLng) {
    Marker newMarker = Marker(
        markerId: const MarkerId('1'),
        position: LatLng(latLng.latitude, latLng.longitude),
        infoWindow: const InfoWindow(title: 'Feira'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));
    markers.add(newMarker);

    print('clicou em ${latLng.latitude} e ${latLng.longitude}');
    setState(() {});
  }
}
