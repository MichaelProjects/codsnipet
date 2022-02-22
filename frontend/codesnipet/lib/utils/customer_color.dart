import 'package:flutter/material.dart';

class CustomColor {
  static MaterialColor swatch = MaterialColor(0x05AD62, greenC);
  static Color green = Color.fromRGBO(5, 162, 91, 10);
  static Color chipBackground = Color.fromRGBO(231, 241, 235, 10);
  static Color purple = Color.fromRGBO(109, 87, 182, 10);
  static Color grey = Color.fromRGBO(85, 83, 83, 10);
  static Color bottomSheetBlack = Color.fromRGBO(37, 37, 37, 24);
  static Color whiteBackground = Color.fromRGBO(241, 242, 244, 10);
  static Color mint = Color.fromARGB(0, 204, 190, 10);
  static Color darkModeContentBlack = Color.fromRGBO(33, 33, 33, 10);
}

Map<int, Color> greenC = {
  50: Color.fromRGBO(5, 162, 91, .1),
  100: Color.fromRGBO(5, 162, 91, .2),
  200: Color.fromRGBO(5, 162, 91, .3),
  300: Color.fromRGBO(5, 162, 91, .4),
  400: Color.fromRGBO(5, 162, 91, .5),
  500: Color.fromRGBO(5, 162, 91, .6),
  600: Color.fromRGBO(5, 162, 91, .7),
  700: Color.fromRGBO(5, 162, 91, .8),
  800: Color.fromRGBO(5, 162, 91, .9),
  900: Color.fromRGBO(5, 162, 91, 1)
};
