import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  GoogleMapsScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.123456, -122.214645),
          zoom: 11.4,
        ));
  }
}
