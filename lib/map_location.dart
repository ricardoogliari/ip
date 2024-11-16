import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocation extends StatelessWidget {
  MapLocation({super.key});

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    Map<String, double?> location =
        ModalRoute.of(context)!.settings.arguments as Map<String, double?>;
    CameraPosition poi = CameraPosition(
      target: LatLng(location["lat"] ?? 0, location["lon"] ?? 0),
      zoom: 14.4746,
    );

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: poi,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
