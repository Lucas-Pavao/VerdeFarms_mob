import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class FeiraController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;

  static FeiraController get to => Get.find<FeiraController>();

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

  getPosition() async {
    try {
      final posicao = await _posicaoAtual();
      latitude.value = posicao.latitude;
      longitude.value = posicao.longitude;
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.grey[900],
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
