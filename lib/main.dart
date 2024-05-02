import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber/constants/themes/dark_theme.dart';
import 'package:uber/constants/themes/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber/screens/main_tap.dart';
import 'package:uber/services/location_permision.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var locationPermissions = LocationPermissions.instance;
  await locationPermissions.getPermissions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(376, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        final currentTheme = MediaQuery.of(context).platformBrightness;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: currentTheme == Brightness.light ? lightTheme : darkTheme,
          home:  const MainTap(),
        );
      },
    );
  }
}
