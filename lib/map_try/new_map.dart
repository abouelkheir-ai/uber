import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/services/location_service.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  GoogleMapController? _controller;
  var locationService = LocationService.instance;

  Uint8List? marketimages;
  List<String> images = [
    'assets/images/ride.png',
  ];

// created empty list of markers
  final List<Marker> _markers = <Marker>[];

// created list of coordinates of various locations
  final List<LatLng> _latLen = <LatLng>[
    const LatLng(31.2398947, 29.9596903),
    const LatLng(31.2398947, 29.9556903),
    const LatLng(31.2398947, 29.9586903),
    const LatLng(31.2388947, 29.9546903),
  ];

// declared method to get Images
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  void initState() {
    super.initState();
    // initialize loadData method
    loadData();
  }

// created method for displaying custom markers according to index
  loadData() async {
    final Uint8List markIcons =
        await getImages(images[0], 70); // Load the image once
    for (int i = 0; i < _latLen.length; i++) {
      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        icon: BitmapDescriptor.fromBytes(markIcons),
        position: _latLen[i],
        infoWindow: InfoWindow(
          title: 'Location: $i',
        ),
      ));
    }
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
              _controller = controller;
                
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            compassEnabled: true,
            markers: Set<Marker>.of(_markers),
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
