import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verde_farm/home_page.dart';
import '../../../Services/feira_service.dart';
import '../../Login/Controllers/login_provider.dart';
import '../Model/feira_model.dart';

class CadastroFeiraController extends ChangeNotifier {
  final LoginProvider loginProvider;
  CadastroFeiraController(this.loginProvider);

  double _latitude = 0.0;
  double _longitude = 0.0;

  double get latitude => _latitude;
  double get longitude => _longitude;

  setLatLong(double lat, double long) {
    _latitude = lat;
    _longitude = long;
    notifyListeners();
  }

  late FeiraService feiraService = FeiraService(loginProvider);
  final Set<Marker> markers = {};

  LatLng get position => LatLng(_latitude, _longitude);

  late GoogleMapController _mapsController;

  void onMapCreated(
      GoogleMapController gmc, LoginProvider loginProvider) async {
    _mapsController = gmc;
    getPosition();

    if (loginProvider.isLoged) _loadFeiras();
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

  getPosition() async {
    try {
      final posicao = await _posicaoAtual();
      setLatLong(posicao.latitude, posicao.longitude);

      _mapsController
          .animateCamera(CameraUpdate.newLatLng(LatLng(_latitude, _longitude)));
    } catch (e) {
      //   Get.snackbar("Error", e.toString(),
      //       backgroundColor: Colors.grey[900],
      //       colorText: Colors.white,
      //       snackPosition: SnackPosition.BOTTOM);
      // }
    }
  }

  void _addMarker(final feira) {
    markers.add(Marker(
      markerId: MarkerId(feira['id'].toString()),
      position: LatLng(
          double.parse(feira['latitude']), double.parse(feira['longitude'])),
      infoWindow: InfoWindow(
        title: feira['nome'],
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ));
  }

  void _loadFeiras() {
    feiraService.getAllFeira().then((feiras) {
      for (var feira in feiras) {
        _addMarker(feira);
      }
      notifyListeners();
    });
  }

  LatLng onMapClicked(LatLng latLng) {
    Marker newMarker = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(latLng.latitude, latLng.longitude),
      infoWindow: const InfoWindow(title: 'Feira'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    markers.add(newMarker);

    debugPrint('clicou em $_latitude e $_longitude');
    notifyListeners();
    return setLatLong(latLng.latitude, latLng.longitude);
  }

  void cadastrarFeira(String nomeDaFeira) async {
    Feira feira = Feira(
      nome: nomeDaFeira,
      latitude: latitude.toString().substring(0, 6),
      longitude: longitude.toString().substring(0, 6),
    );

    final response = await feiraService.postFeira(feira);
    debugPrint(response.toString());
  }
}
