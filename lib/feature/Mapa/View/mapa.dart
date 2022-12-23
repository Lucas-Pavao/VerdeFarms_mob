import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import 'package:verde_farm/feature/Mapa/Controller/mapa_controller.dart';
import 'Components/login_nav_bar.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  void initState() {
    // String? token = GeneralConstants.prefs.getString('token');
    // debugPrint(token);
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      LoginProvider.checkLoggedUser();
    });
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
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: controller.position,
                zoom: 13,
              ),
              onMapCreated: controller.onMapCreated,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green[600],
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  weight: Checkbox.width,
                ),
              ),
            ),
          ),
          Obx(() {
            return Positioned(
              bottom: 0,
              child: LoginProvider.isLoged()
                  ? const SizedBox(
                      height: 0,
                      width: 0,
                    )
                  : const LoginNavBar(),
            );
          }),
        ],
      ),
    );
  }
}
