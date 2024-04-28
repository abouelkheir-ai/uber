
import 'package:flutter/material.dart';
import 'package:uber/home.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  Widget? _activeWidget = Home();
  
  @override
  Widget build(BuildContext context) {
    return _activeWidget! ;
  }
}