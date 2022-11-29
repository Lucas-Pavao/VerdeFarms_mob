import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verde_farm/constants/general_constants.dart';
import 'package:verde_farm/controllers/mapa_controller.dart';

import '../Components/login_nav_bar.dart';
import '../Components/nav_bar.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  void initState() {
    // TODO: implement initState
    GeneralConstants generalConstants = GeneralConstants();
    generalConstants.checkLoggedUser();
    String? token = GeneralConstants.prefs.getString('token');
    print(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapaController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GetBuilder<MapaController>(
              init: controller,
              builder: (value) => GoogleMap(
                    compassEnabled: true,
                    mapToolbarEnabled: false,
                    mapType: MapType.normal,
                    myLocationEnabled: false,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: controller.position,
                      zoom: 13,
                    ),
                    onMapCreated: controller.onMapCreated,
                  )),
          Obx(() {
            return Positioned(
              bottom: 0,
              child: GeneralConstants.isLoged()
                  ? const NavBar()
                  : const LoginNavBar(),
            );
          }),
        ],
      ),
    );
  }
}
