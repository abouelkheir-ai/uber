import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  // Define the primary color for your app
  primaryColor: Colors.white,
  // Define the default font family
  fontFamily: 'Roboto',
  // Define the text theme for your app
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins-Bold',
    ),
    headlineMedium: TextStyle(
      fontSize: 22.sp,
      fontFamily: 'Poppins-Bold',
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: Colors.black,
        fontFamily: 'Poppins-SemiBold',
        fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        fontSize: 16.sp,
        color: Color(0xff6B6B6B),
        fontFamily: 'Poppins-SemiBold',
        fontWeight: FontWeight.w400),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.black,
    onPrimaryContainer: const Color(0xffAFAFAF),
    secondary: const Color(0xffAFAFAF).withOpacity(0.4),
    onSecondary: Colors.white, // Adjust as needed
    error: Colors.red,
    onError: Colors.white, // Adjust as needed
    background: Color(0xffEEEEEE), // Adjust as needed
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
);
