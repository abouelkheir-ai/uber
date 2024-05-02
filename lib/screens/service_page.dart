import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber/widgets/app_bar.dart';
import 'package:uber/widgets/service_container.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final List<Widget> _serviceBox = [
    const ServiceBox(
      title: 'Ride',
      imagePath: 'assets/images/ride.png',
      hasPromo: true,
    ),
    const ServiceBox(
      title: 'Package',
      imagePath: 'assets/images/package.png',
      hasPromo: false,
    ),
    const ServiceBox(
      title: 'Rental',
      imagePath: 'assets/images/rental.png',
      hasPromo: true,
    ),
    const ServiceBox(
      title: 'Reserve',
      imagePath: 'assets/images/calender.png',
      hasPromo: false,
    ),
    const ServiceBox(
      title: 'Shuttle',
      imagePath: 'assets/images/package.png',
      hasPromo: false,
    ),
    const ServiceBox(
      title: 'intercity',
      imagePath: 'assets/images/rental.png',
      hasPromo: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50.h),
          child: const MyAppBar(title: 'Service')),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Go anywhere get anything',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: _serviceBox.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => _serviceBox[index]),
          ),
        ],
      ),
    );
  }
}
