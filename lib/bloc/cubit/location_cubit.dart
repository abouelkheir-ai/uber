import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<Position> getLocation() async {
    // Get current position
    try {
      await getPermission();
      emit(LocationLoading());
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(LocationSucess());
      return currentPosition;
    } on Exception catch (e) {
      emit(LocationFailure());
      print(e.toString());
      throw Exception();
    }
  }

  getPermission() async {
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

