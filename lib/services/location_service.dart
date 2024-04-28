import 'package:geolocator/geolocator.dart';
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
  LocationService _locationService;
  MyLocation(this._locationService);

// Add your singleton's methods and properties here.
  Future<Position> getLocation() async {
    // Get current position
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return currentPosition;
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }
}
