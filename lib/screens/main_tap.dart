import 'package:flutter/material.dart';
import 'package:uber/screens/home.dart';
import 'package:uber/screens/service_page.dart';
import 'package:uber/widgets/bottom_navigation_widget.dart';

class MainTap extends StatefulWidget {
  const MainTap({super.key, this.currentIndex});
  final int? currentIndex;
  @override
  State<MainTap> createState() => _MainTapState();
}

class _MainTapState extends State<MainTap> {
  final List<Widget> _screen = [
    const Home(),
    const ServicePage(),
    // const Activity(),
    // const ProfileScreen(),
  ];
  late Widget? _currentWidget;
  @override
  void initState() {
    _currentWidget = _screen[widget.currentIndex ?? 0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _currentWidget == null
        ? const Home()
        : Scaffold(
            body: _currentWidget,
            bottomNavigationBar: const CustomizedButtonNavigation(),
          );
  }
}
