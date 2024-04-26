import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/bloc/cubit/location_cubit.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late Position _currentPosition;
  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    Position myPosition =
        await BlocProvider.of<LocationCubit>(context).getLocation();
    setState(() {
      _currentPosition = myPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mapWidget;
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationLoading) {
          // Show CircularProgressIndicator when loading
          mapWidget = const Center(child: CircularProgressIndicator());
        } else {
          // Show GoogleMap when not loading
          mapWidget = GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _currentPosition != null
                ? CameraPosition(
                    target: LatLng(
                      _currentPosition.latitude,
                      _currentPosition.longitude,
                    ),
                    zoom: 14,
                  )
                : const CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 14,
                  ),
            onMapCreated: (GoogleMapController controller) {
              // controller.setMapStyle(Utils.mapStyles);
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
          );
        }

        return Scaffold(
          body: SafeArea(
            child: mapWidget,
          ),
        );
      },
    );
  }
}
