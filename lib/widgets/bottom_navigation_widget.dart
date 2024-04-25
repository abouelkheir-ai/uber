import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomizedButtonNavigation extends StatefulWidget {
  const CustomizedButtonNavigation({super.key});

  @override
  State<CustomizedButtonNavigation> createState() =>
      _CustomizedButtonNavigationState();
}

class _CustomizedButtonNavigationState
    extends State<CustomizedButtonNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/home.svg', // Replace with your SVG file path
            width: 24,
            height: 24,
          ),
          label: "Home ",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/service.svg',
            width: 24,
            height: 24,
          ),
          label: "Service",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/activity.svg',
            width: 24,
            height: 24,
          ),
          label: "activity",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/account.svg',
            width: 24,
            height: 24,
          ),
          label: "account",
        ),
      ],
    );
  }
}
