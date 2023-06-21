import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

GoogleMapController? _controller;

final CameraPosition _initialCameraPosition = CameraPosition(
  target: LatLng(41.015137, 28.979530),
  zoom: 15,
);

Set<Marker> _markers = {
  Marker(
    markerId: MarkerId('marker_1'),
    position: LatLng(41.015137, 28.979530),
  ),
};

GoogleMap(
initialCameraPosition: _initialCameraPosition,
markers: _markers,
onMapCreated: (controller) {
_controller = controller;
},
)
