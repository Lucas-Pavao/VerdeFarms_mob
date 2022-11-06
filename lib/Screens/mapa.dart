import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verde_farm/controllers/feira_controller.dart';

class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeiraController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Obx(
                  () => Text(
                      'Lat ${controller.latitude.value} Lng ${controller.longitude.value}'),
                ),
                ElevatedButton(
                    onPressed: () => controller.getPosition(),
                    child: Text('Localização'))
              ]),
        ),
      ),
    );
  }
}
