import 'package:flutter/material.dart';

class ServiceBox extends StatelessWidget {
  const ServiceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 75,
            height: 72,
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/images/ride.png',
            ),
          ),
        ),
        Text('Ride'),
      ],
    );
  }
}
