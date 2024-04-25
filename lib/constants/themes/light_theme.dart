import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // Define the primary color for your app
  primaryColor: Colors.black,
  // Define the default font family
  fontFamily: 'Roboto',
  // Define the text theme for your app
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: 'Poppins-Bold',
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontFamily: 'Poppins-Bold',
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontFamily: 'Poppins-SemiBold',
        fontWeight: FontWeight.w500),
    bodySmall: TextStyle(
        fontSize: 15,
        color: Color(0xff6B6B6B),
        fontFamily: 'Poppins-SemiBold',
        fontWeight: FontWeight.w400),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.white,
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white, // Adjust as needed
    error: Colors.red,
    onError: Colors.white, // Adjust as needed
    background: Colors.grey, // Adjust as needed
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
);
