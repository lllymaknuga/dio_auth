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
        target: LatLng(54.72822382690697, 55.96038932418227),
        zoom: 11.4,
      ),
    );
  }
}
