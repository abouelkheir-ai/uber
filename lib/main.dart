import 'package:flutter/material.dart';
import 'package:uber/constants/themes/light_theme.dart';
import 'package:uber/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber Demo',
      theme: lightTheme,
      darkTheme:lightTheme ,
      home: const Home(),
    );
  }
}
