import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMaps extends StatelessWidget {
  CustomMaps({super.key});

  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.76793803776069, 90.42635958281406),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        rotateGesturesEnabled: false,
        scrollGesturesEnabled: false,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        liteModeEnabled: false,
        tiltGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
