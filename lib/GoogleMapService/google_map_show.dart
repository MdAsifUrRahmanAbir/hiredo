import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsShow extends StatefulWidget {
  const GoogleMapsShow({
    super.key,
    required this.lat,
    required this.leng,
  });

  final String lat;
  final String leng;

  @override
  State<GoogleMapsShow> createState() => _GoogleMapsShowState();
}

class _GoogleMapsShowState extends State<GoogleMapsShow> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late CameraPosition _kGooglePlex;

  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.lat), double.parse(widget.leng)),
      zoom: 14.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
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
    );
  }
}
