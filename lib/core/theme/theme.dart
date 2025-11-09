import 'package:flutter/material.dart';

class AppTheme {
  static final darkThemeMode = ThemeData.dark().copyWith(
   scaffoldBackgroundColor: Colors.black12,
   inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.all(20),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade800,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10)
    ),

    focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(
        color: Colors.grey.shade800,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10)
    )
   ),
  );
}