import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black12,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black12
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade800, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: Colors.white
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        fixedSize: Size(double.infinity, 55), side: BorderSide(
          width: 1, color: Colors.grey.shade800
        )),)
  );
}
