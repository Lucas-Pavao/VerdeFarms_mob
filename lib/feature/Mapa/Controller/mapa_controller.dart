import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  late StreamSubscription<Position> positionStream;

  final LatLng _position = const LatLng(0.0, 0.0);
  late GoogleMapController _mapsController;

  static MapaController get to => Get.find<MapaController>();
  get mapsController => _mapsController;
  get position => _position;

  onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosition();
    watchPosition();
    // loadFeiras();
    // loadVendedores();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();

    if (!ativado) {
      return Future.error('Por favor, habilite a loclização no smartphone!');
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
    }

    if (permissao == LocationPermission.denied) {
      return Future.error('Você precisa autorizar o acesso a localização!');
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error("Autorize o acesso a localização nas configurações");
    }

    return Geolocator.getCurrentPosition();
  }

  watchPosition() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
    });
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }

  getPosition() async {
    try {
      final posicao = await _posicaoAtual();
      latitude.value = posicao.latitude;
      longitude.value = posicao.longitude;
      _mapsController.animateCamera(
          CameraUpdate.newLatLng(LatLng(latitude.value, longitude.value)));
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.grey[900],
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
