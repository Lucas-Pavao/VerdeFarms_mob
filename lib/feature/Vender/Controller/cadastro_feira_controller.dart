import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../Services/feira_service.dart';
import '../Model/feira_model.dart';

class CadastroFeiraController {
  static List<Marker> markers = [];
  LatLng position = const LatLng(0, 0);
  TextEditingController nomeFeiraController = TextEditingController();
  FeiraService feiraService = FeiraService();

  onTap(LatLng latLng) {
    Marker newMarker = Marker(
        markerId: const MarkerId('1'),
        position: LatLng(latLng.latitude, latLng.longitude),
        infoWindow: const InfoWindow(title: 'Feira'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen));

    markers.add(newMarker);
    debugPrint('clicou em ${latLng.latitude} e ${latLng.longitude}');
    return position = LatLng(latLng.latitude, latLng.longitude);
  }

  // cadastroFeira(BuildContext context) {
  //   _cadastrarFeira();
  //   Navigator.pop(context);
  // }

  cadastrarFeira() async {
    Feira feira = Feira(
        nome: nomeFeiraController.text,
        latitude: position.latitude,
        longitude: position.longitude);
    final response = await feiraService.postFeira(feira);
    debugPrint(response.toString());
  }
}
