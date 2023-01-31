import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verde_farm/Services/localizacao_service.dart';
import '../../../Services/feira_service.dart';
import '../../Login/Controllers/login_provider.dart';
import '../../Vender/Model/feira_model.dart';
import '../Model/localizacao_model.dart';

class MapaController extends ChangeNotifier {
  final LoginProvider loginProvider;
  MapaController(this.loginProvider);

  bool myLocationEnabled = true;

  double _latitude = 0.0;
  double _longitude = 0.0;

  setLatLong(double lat, double long) {
    _latitude = lat;
    _longitude = long;
    notifyListeners();
  }

  late StreamSubscription<Position> positionStream;
  late FeiraService feiraService = FeiraService(loginProvider);
  late LocalizacaoService localizacaoService =
      LocalizacaoService(loginProvider);

  final Set<Marker> markers = {};

  LatLng get position => LatLng(_latitude, _longitude);

  late GoogleMapController _mapsController;

  // static MapaController get to => Get.find<MapaController>();
  // get mapsController => _mapsController;

  void onMapCreated(GoogleMapController gmc) async {
    _mapsController = gmc;
    getPosition();
    watchPosition();
    if (loginProvider.isLoged) {
      _loadFeiras();
      // _loadUserLoc();
    }

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

  void watchPosition() async {
    positionStream = Geolocator.getPositionStream().listen((Position position) {
      setLatLong(position.latitude, position.longitude);
    });
  }

  void myLocationButtonEnabled() {
    myLocationEnabled = !myLocationEnabled;

    // do {
    //   Timer(const Duration(minutes: 1), () {
    //     debugPrint('Timer');
    //     // localizacaoService.deleteLocalizacao();
    //     getPosition();
    //     localizacaoService.postLocalizacao(Localizacao(
    //         latitude: _latitude.toString(), longitude: _longitude.toString()));
    //   });
    // } while (myLocationEnabled);

    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    positionStream.cancel();
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

  void _addMarkerFeira(Feira feira) {
    markers.add(Marker(
      markerId: MarkerId(feira.id.toString()),
      position: LatLng(double.parse(feira.latitude ?? "0.0"),
          double.parse(feira.longitude ?? "0.0")),
      infoWindow: InfoWindow(
        title: feira.nome,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ));
  }

  void _loadFeiras() {
    feiraService.getAllFeira().then((feiras) {
      for (var feira in feiras) {
        _addMarkerFeira(feira);
      }
      notifyListeners();
    });
  }

  // void _addMarkerUser(final loc) {
  //   markers.add(Marker(
  //     markerId: MarkerId(loc['id'].toString()),
  //     position:
  //         LatLng(double.parse(loc['latitude']), double.parse(loc['longitude'])),
  //     infoWindow: InfoWindow(
  //       title: loc['nome'],
  //     ),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  //   ));
  // }

  // void _loadUserLoc() {
  //   localizacaoService.getAllLocalizacao().then((localizacao) {
  //     localizacao?.forEach((loc) {
  //       _addMarkerUser(loc);
  //     });
  //     notifyListeners();
  //   });
  // }
}
