import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uber/controller/map_controller.dart';

class MapWithCurrentLocation extends StatefulWidget {
  const MapWithCurrentLocation({super.key});

  @override
  State<MapWithCurrentLocation> createState() => _MapWithCurrentLocationState();
}

class _MapWithCurrentLocationState extends State<MapWithCurrentLocation> {
  GoogleMapController? _controller;
  LatLng _currentPosition =
      const LatLng(31.2468482, 29.9936937); // Default position
    final MapController _mapController = MapController();
  List<LatLng> _driverLocationList = [];
  @override
  void initState() {
    super.initState();
    _initializeDriverLocation();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    _driverLocationList = _mapController.driversLocation;
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    if (position != null &&
        position.latitude != null &&
        position.longitude != null) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      _startLocationUpdates();
    } else {
      // Handle error: Unable to fetch current location
      print('Error: Unable to fetch current location');
    }
  }

  void _startLocationUpdates() {
    Geolocator.getPositionStream().listen((Position position) {
      _updateLocation(position);
    });
  }

  void _updateLocation(Position position) {
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
    _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  Future<void> _initializeDriverLocation() async {
    await _mapController.loadDriversLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: Set<Marker>.of(_mapController.markers),
      ),
    );
  }
}
