import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/data/driver_controller.dart';
import 'package:uber/services/location_service.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    fetchDriverLocation();
    super.initState();
  }

  final Completer<Map<String, dynamic>> _driverLocationCompleter =
      Completer<Map<String, dynamic>>();

  GoogleMapController? _controller;
  var locationService = LocationService.instance;
  Map<String, Marker> _markers = {};
        Position myPosition = snapshot.data as Position;

   Future<void> fetchDriverLocation() async {
    // Call getDriverLocation() to retrieve the driver's location
    Map<String, dynamic> location = await getDriverLocation();
    if (location.isNotEmpty) {
      // _updateMarker(location);
      // _moveCamera(location);
      _driverLocationCompleter.complete(location);
    } else {
      _driverLocationCompleter.completeError('Failed to fetch driver location');
    }
  }

  // void _updateMarker(Map<String, dynamic> location) {
  //   final marker = Marker(
  //     markerId: const MarkerId('driver'),
  //     position: LatLng(location['latitude'], location['longitude']),
  //     infoWindow: const InfoWindow(title: 'Driver Location'),
  //   );

  //   setState(() {
  //     _markers['driver'] = marker;
  //   });
  // }

  // void _moveCamera(Map<String, dynamic> location) {
  //   final newCameraPosition = CameraPosition(
  //     target: LatLng(location['latitude'], location['longitude']),
  //     zoom: 15,
  //   );

  //   _controller
  //       ?.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
  // }

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
              _controller = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            compassEnabled: true,
            markers: {
              Marker(
                markerId: const MarkerId('location_marker'),
                position: LatLng(myPosition.latitude, myPosition.longitude),
                infoWindow: const InfoWindow(title: 'Location'),
              ),
              Marker(
                markerId: const MarkerId('car_marker'),
                position: LatLng(myPosition.latitude, myPosition.longitude),
                infoWindow: const InfoWindow(title: 'car_Location'),
              ),
            },
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
