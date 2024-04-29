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
  final MapController _mapController = MapController();
  late GoogleMapController _googleMapController;
  late Position myPosition;
  MyLocation location = MyLocation(LocationService.instance);
  bool _isMapInitialized =
      false; // Flag to track if the map is already initialized

  @override
  void initState() {
    super.initState();
    _currentLocation();
  }

  Future<void> _currentLocation() async {
    myPosition = await location.getLocation();
    _initializeMap();
    _liveLocation();
  }

  void _initializeMap() async {
    if (!_isMapInitialized) {
      // Ensure map is initialized only once
      await _mapController.driversLocation();
      setState(() {
        _isMapInitialized = true;
      });
    }
  }

  void _liveLocation() {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 10,
      ),
    ).listen((Position? position) {
      if (position != null) {
        setState(() {
          myPosition = position;
          _updateCameraPosition();
        });
      }
    });
  }

  void _updateCameraPosition() async {
    if (_googleMapController != null) {
      _googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(myPosition.latitude, myPosition.longitude),
            zoom: 15.5,
          ),
        ),
      );
    }
  }

  Widget _locationBuilder(context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
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
              _googleMapController = controller;
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
    // Store the location once it's retrieved
    return FutureBuilder(
      future: location.getLocation(),
      builder: _locationBuilder,
    );
  }
}
