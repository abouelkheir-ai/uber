import 'package:geolocator/geolocator.dart';
import 'package:uber/services/location_permision.dart';

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

  // Add your singleton's methods and properties here.
  Future<Position> getLocation() async {
    // Get current position
    try {
      var locationPermissions = LocationPermissions.instance;
      await locationPermissions.getPermissions();
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return currentPosition;
    } on Exception catch (e) {
      throw Exception();
    }
  }

  Future<Position> getLiveLocation() async {
    // Get current position
    try {
      var locationPermissions = LocationPermissions.instance;
      await locationPermissions.getPermissions();
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return currentPosition;
    } on Exception catch (e) {
      throw Exception();
    }
  }
}
