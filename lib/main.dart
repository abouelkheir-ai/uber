import 'package:flutter/material.dart';
import 'package:uber/constants/themes/dark_theme.dart';
import 'package:uber/constants/themes/light_theme.dart';
import 'package:uber/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber/map_try/map.dart';
import 'package:uber/map_try/new_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = MediaQuery.of(context).platformBrightness;
    const brightMode = Brightness.light;
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(376, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Uber Demo',
          // You can use the library anywhere in the app even in theme
          theme: currentTheme == brightMode ? lightTheme : darkTheme,

          home: child,
        );
      },
      child: NewMap(),
    );
  }
}
