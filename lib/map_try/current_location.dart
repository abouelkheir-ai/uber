// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapWithCurrentLocation extends StatefulWidget {
//   @override
//   _MapWithCurrentLocationState createState() => _MapWithCurrentLocationState();
// }

// class _MapWithCurrentLocationState extends State<MapWithCurrentLocation> {
//   GoogleMapController? _controller;
//   LatLng? _currentLocation;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     Location location = Location();
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     _locationData = await location.getLocation();
//     setState(() {
//       _currentLocation =
//           LatLng(_locationData.latitude!, _locationData.longitude!);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Map with Current Location')),
//       body: _currentLocation == null
//           ? const Center(child: CircularProgressIndicator())
//           : GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: _currentLocation!,
//                 zoom: 15,
//               ),
//               onMapCreated: (GoogleMapController controller) {
//                 _controller = controller;
//               },
//               markers: {
//                 Marker(
//                   markerId: const MarkerId('current_location'),
//                   position: _currentLocation!,
//                   infoWindow: const InfoWindow(title: 'Current Location'),
//                 ),
//               },
//             ),
//     );
//   }
// }


