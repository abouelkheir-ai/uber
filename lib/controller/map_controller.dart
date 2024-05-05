import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:uber/data/driver_controller.dart';
import 'package:uber/models/driver.dart';

class MapController {
  MapController();

  final String _imagesPath = 'assets/images/ride.png';
  final List<Marker> _markers = [];
  get markers => _markers;
  final HandleDriverData _driverData =
      HandleDriverData(FirebaseFirestore.instance);
  final List<LatLng> _driverLocations = [];
  get driversLocation => _driverLocations;
  Future<void> loadDriversLocation() async {
    try {
      List<Driver> nearDriverList = await _driverData.getAllDriversDetails();
      _addLocationToMap(nearDriverList);
      await _loadData();
    } catch (e) {
      print('Error loading drivers location: $e');
      // Handle error gracefully, maybe show a message to the user
    }
  }

  void _addLocationToMap(List<Driver> drivers) {
    _driverLocations.clear();
    for (var driver in drivers) {
      print("driver.latitude");
      if (driver.latitude != null && driver.longitude != null) {
        _driverLocations.add(LatLng(driver.latitude!, driver.longitude!));
      }
    }
    print(_driverLocations[0].latitude);
  }

  Future<Uint8List> _getImageBytes(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Future<void> _loadData() async {
    final Uint8List markerIconBytes = await _getImageBytes(_imagesPath, 70);
    _markers.clear();
    for (int i = 0; i < _driverLocations.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(i.toString()),
          icon: BitmapDescriptor.fromBytes(markerIconBytes),
          position: _driverLocations[i],
          infoWindow: InfoWindow(
            title: 'Driver $i',
          ),
        ),
      );
    }
  }
}
