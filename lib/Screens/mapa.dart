import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:verde_farm/Screens/cadastro.dart';
import 'package:verde_farm/Screens/login.dart';
import 'package:verde_farm/controllers/feira_controller.dart';

import '../Components/login_nav_bar.dart';

class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeiraController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GetBuilder<FeiraController>(
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
          const Positioned(
            bottom: 0,
            child: LoginNavBar(),
          ),
        ],
      ),

      // Column(
      //   children: [
      //     GetBuilder<FeiraController>(
      //         init: controller,
      //         builder: (value) => GoogleMap(
      //               mapType: MapType.normal,
      //               zoomControlsEnabled: true,
      //               initialCameraPosition: CameraPosition(
      //                 target: controller.position,
      //                 zoom: 13,
      //               ),
      //               onMapCreated: controller.onMapCreated,
      //               myLocationEnabled: true,
      //             )),
      //     Center(
      //       child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: <Widget>[
      //             Obx(
      //               () => Text(
      //                   'Lat ${controller.latitude.value} Lng ${controller.longitude.value}'),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: ElevatedButton(
      //                   onPressed: () => controller.getPosition(),
      //                   child: Text('Localização')),
      //             ),
      //             Container(
      //               decoration: BoxDecoration(
      //                 color: Colors.blueGrey,
      //                 borderRadius: BorderRadius.only(
      //                   topLeft: Radius.circular(30),
      //                   topRight: Radius.circular(30),
      //                 ),
      //               ),
      //               child: Align(
      //                 alignment: Alignment.bottomCenter,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     SizedBox(
      //                       width: 150,
      //                       height: 100,
      //                       child: ElevatedButton(
      //                         style: ButtonStyle(
      //                             elevation:
      //                                 MaterialStateProperty.all<double>(0),
      //                             backgroundColor:
      //                                 MaterialStateProperty.all<Color>(
      //                                     Colors.blueGrey)),
      //                         onPressed: () => Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                                 builder: (context) =>
      //                                     const Cadastro())),
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Icon(Icons.account_circle),
      //                             Text('Cadastrar'),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       width: 150,
      //                       height: 100,
      //                       child: ElevatedButton(
      //                         style: ButtonStyle(
      //                             elevation:
      //                                 MaterialStateProperty.all<double>(0),
      //                             shadowColor:
      //                                 MaterialStateProperty.all<Color>(
      //                                     Colors.blueGrey),
      //                             backgroundColor:
      //                                 MaterialStateProperty.all<Color>(
      //                                     Colors.blueGrey)),
      //                         onPressed: () => Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                                 builder: (context) =>
      //                                     const LoginPage())),
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Icon(Icons.login),
      //                             Text('Login'),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             )
      //           ]),
      //     ),
      //   ],
    );
  }
}
