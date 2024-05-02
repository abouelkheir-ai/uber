import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  // Private constructor prevents direct instantiation from outside.
  LocationService._();

  // Singleton instance variable.
  static LocationService? _instance;

  // Getter for accessing the singleton instance.
  static LocationService get instance {
    // Create instance if it doesn't exist.
    _instance ??= LocationService._();
    return _instance!;
  }
}

class MyLocation {
  final LocationService _locationService;
  MyLocation(this._locationService);

// Add your singleton's methods and properties here.
  Future<LatLng> getLocation() async {
    // Get current position
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return LatLng(currentPosition.latitude, currentPosition.longitude);
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }
}
