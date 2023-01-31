import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:verde_farm/feature/Login/Controllers/login_provider.dart';
import 'package:verde_farm/feature/Mapa/Controller/mapa_controller.dart';
import 'Components/login_nav_bar.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key, required this.loginProvider});
  final LoginProvider loginProvider;

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late MapaController controller = MapaController(widget.loginProvider);
  @override
  void initState() {
    // String? token = GeneralConstants.prefs.getString('token');
    // debugPrint(token);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Consumer<LoginProvider>(
        builder: (context, loginProvider, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              GoogleMap(
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
                onMapCreated: (gmc) => controller.onMapCreated(gmc),
                markers: controller.markers,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: controller.myLocationEnabled
                        ? Colors.green[900]
                        : Colors.red[900],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.myLocationButtonEnabled();
                    },
                    icon: Icon(
                      controller.myLocationEnabled
                          ? Icons.location_on_outlined
                          : Icons.location_off_outlined,
                      color: Colors.white,
                      weight: Checkbox.width,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: loginProvider.isLoged
                    ? const SizedBox(
                        height: 0,
                        width: 0,
                      )
                    : LoginNavBar(loginProvider: widget.loginProvider),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
