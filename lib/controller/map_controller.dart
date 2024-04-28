import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:uber/data/driver_controller.dart';
import 'package:uber/models/driver.dart';

class MapController {
   MapController();

  Uint8List? marketimages;

  List<String> images = [
    'assets/images/ride.png',
  ];

  // created empty list of markers
  List<Marker> markers = <Marker>[];

  final HandleDriverData _driverData = HandleDriverData(FirebaseFirestore.instance);
  List<Driver> _nearDiverList = [];

  Future<void> driversLocation() async {
    _nearDiverList = await _driverData.getAllDriversDetails();
    await _addLocationToMap();
    await loadData();
    return;
  }
// created list of coordinates of various locations

  final List<LatLng> _latLen = <LatLng>[
    const LatLng(31.2398947, 29.9596903),
    const LatLng(31.2398947, 29.9556903),
    const LatLng(31.2398947, 29.9586903),
    const LatLng(31.2388947, 29.9546903),
  ];

  Future<void> _addLocationToMap() async {
    for (int i = 0; i < _nearDiverList.length; i++) {
      _latLen.add(LatLng(
        _nearDiverList[i].latitude ?? 0,
        _nearDiverList[i].longitude ?? 0,
      ));
    }
  }

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

// loading car Marker on map places
  loadData() async {
    final Uint8List markIcons =
        await getImages(images[0], 70); // Load the image once
    for (int i = 0; i < _latLen.length; i++) {
      markers.add(Marker(
        markerId: MarkerId(i.toString()),
        icon: BitmapDescriptor.fromBytes(markIcons),
        position: _latLen[i],
        infoWindow: InfoWindow(
          title: 'Location: $i',
        ),
      ));
    }
  }
}
