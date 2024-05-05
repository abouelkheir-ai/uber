import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/controller/map_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  LatLng _currentPosition =
      const LatLng(31.2468482, 29.9936937); // Default position
  final MapController _mapController = MapController();
  @override
  void initState() {
    super.initState();
    _initializeDriverLocation();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
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
    if (mounted) {
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      _controller?.animateCamera(CameraUpdate.newLatLng(_currentPosition));
    }
  }

  Future<void> _initializeDriverLocation() async {
    await _mapController.loadDriversLocation();

    setState(() {});
  }

  _initializeBottomSheet() {
    showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Adjust padding for keyboard
          ),
          child: Column(
            children: [
              const Text('Set your pick-up location'),
              const Text('Drag the map to move the pin'),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Current Location'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: Container(
          width: 47.w,
          height: 47.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
