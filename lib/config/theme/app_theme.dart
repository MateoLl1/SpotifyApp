


import 'package:flutter/material.dart';

class AppTheme {
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.green,

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 30
      )
    )

  );

}