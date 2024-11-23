import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controllers/db_controller.dart';
import 'package:myapp/controllers/rest_controller.dart';
import 'package:myapp/main.dart';
import 'package:myapp/source/local/database.dart';
import 'package:myapp/model/geo_data.dart' as model;

class Online extends GetView<RestController> {
  Online({super.key});

  final TextEditingController _ipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _ipController,
              maxLength: 15,
              decoration: const InputDecoration(
                labelText: 'My IP',
              ),
            ),
            TextButton(
                onPressed: () async {
                  controller.getGeoIp(ip: _ipController.text);
                },
                child: const Text("Find")),
            controller.obx(
              (geo) {
                Get.find<DbController>().insertData(geo: geo);

                return Card(
                  child: Wrap(
                    children: [
                      ListTile(
                        title: Text('City: ${geo?.city}'),
                      ),
                      ListTile(
                        title: Text('Region Name: ${geo?.regionName}'),
                      ),
                      ListTile(
                        title: Text('Country: ${geo?.country}'),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, mapRoute,
                                arguments: {"lat": geo?.lat, "lon": geo?.lon});
                          },
                          icon: const Icon(Icons.map_outlined))
                    ],
                  ),
                );
              },
              onEmpty: null,
              onLoading: const CircularProgressIndicator(),
              onError: (error) => Text(error ?? "Erro inesperado!"),
            )
          ],
        ));
  }
}
