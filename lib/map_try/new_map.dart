import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/services/location_service.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  var locationService = LocationService.instance;

  Widget _locationBuilder(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      // While waiting for the location, show a loading indicator.
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (snapshot.hasError) {
      return Scaffold(
        body: Center(
          child: Text('Error: ${snapshot.error}'),
        ),
      );
    } else {
      Position myPosition = snapshot.data as Position;
      return Scaffold(
        body: SafeArea(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                myPosition.latitude,
                myPosition.longitude,
              ),
              zoom: 17,
            ),
            onMapCreated: (GoogleMapController controller) {
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locationService
            .getLocation(), // or BlocProvider.of<LocationCubit>(context).getLocation(),
        builder: _locationBuilder);
  }
}
