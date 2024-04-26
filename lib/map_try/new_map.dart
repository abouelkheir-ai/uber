import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewMap extends StatelessWidget {
  const NewMap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(25.1193, 55.3773), zoom: 14),
      ),
    );
  }
}
