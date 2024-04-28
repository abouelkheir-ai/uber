import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/controller/map_controller.dart';
import 'package:uber/services/location_service.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  // GoogleMapController? _controller;
  var locationService = LocationService.instance;
  final MapController _mapController = MapController();

  @override
  void initState()   {
    super.initState();
    _initializeMap();
  }
Future<void> _initializeMap() async {
    await _mapController.driversLocation();
    setState(() {});
  }

  Widget _locationBuilder(context, AsyncSnapshot snapshot) {
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
              zoom: 15.5,
            ),
            onMapCreated: (GoogleMapController controller) {
              // _controller = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            compassEnabled: true,
            markers: Set<Marker>.of(_mapController.markers),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    MyLocation location = MyLocation(locationService);
    return FutureBuilder(
        future: location.getLocation(), // or BlocProvider.of<LocationCubit>(context).getLocation(),
        builder: _locationBuilder);
  }
}
