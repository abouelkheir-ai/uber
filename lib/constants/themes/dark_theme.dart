import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData darkTheme = ThemeData(
  // Define the primary color for your app
  primaryColor: Colors.black,
  // Define the default font family
  fontFamily: 'Roboto',
  // Define the text theme for your app
  textTheme:  TextTheme(
    headlineLarge: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Poppins-Bold',
    ),
    headlineMedium: TextStyle(
      fontSize: 22.sp,
      fontFamily: 'Poppins-Bold',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: Colors.white,
        fontFamily: 'Poppins-SemiBold',
        fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        fontSize: 15.sp,
        color: Color(0xff6B6B6B),
        fontFamily: 'Poppins-SemiBold',
        fontWeight: FontWeight.w400),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.white,
    onPrimary: Colors.white,
    secondary: Color(0xff6B6B6B), // Adjust as needed
    onSecondary: Color(0xffAFAFAF),
    error: Colors.red,
    onError: Colors.black, // Adjust as needed
    background: Colors.black, // Adjust as needed
    onBackground: Colors.black,
    surface: Colors.black,
    onSurface: Colors.black,
  ),
);
