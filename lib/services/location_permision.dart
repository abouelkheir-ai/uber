import 'package:geolocator/geolocator.dart';

class LocationPermissions {
  // Private constructor prevents direct instantiation from outside.
  LocationPermissions._();

  // Singleton instance variable.
  static LocationPermissions? _instance;

  // Getter for accessing the singleton instance.
  static LocationPermissions get instance {
    // Create instance if it doesn't exist.
    _instance ??= LocationPermissions._();
    return _instance!;
  }

  getPermissions() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, prompt user to enable location
      return;
    }

    // Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Permission is denied, request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission is still denied, show error message
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission is denied forever, handle appropriately
      return;
    }
  }
}
