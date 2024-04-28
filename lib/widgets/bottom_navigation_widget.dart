import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomizedButtonNavigation extends StatefulWidget {
  const CustomizedButtonNavigation({super.key});

  @override
  State<CustomizedButtonNavigation> createState() =>
      _CustomizedButtonNavigationState();
}

int _currentIndex = 0;

class _CustomizedButtonNavigationState
    extends State<CustomizedButtonNavigation> {
  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      fixedColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        _currentIndex = value;
        setState(() {});
      },
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/home.svg',
            width: 24.w,
            height: 24.h,
          ),
          label: "Home ",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/service.svg',
            width: 24.w,
            height: 24.h,
          ),
          label: "Service",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/activity.svg',
            width: 24.w,
            height: 24.h,
          ),
          label: "activity",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/bottom_navigation/account.svg',
            width: 24.w,
            height: 24.h,
          ),
          label: "account",
        ),
      ],
    );
  }
}
