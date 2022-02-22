import 'package:flutter/material.dart';

TextTheme buildTextTheme(BuildContext context) {
  return const TextTheme(
      headline5: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.0),
      headline6: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.0),
      button: TextStyle(
          fontSize: 14,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0),
      subtitle1:
          TextStyle(fontSize: 15, color: Colors.grey, letterSpacing: 0.5));
}
