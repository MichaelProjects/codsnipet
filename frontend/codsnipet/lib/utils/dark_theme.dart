import 'package:flutter/material.dart';

import 'customer_color.dart';
import 'text_theme.dart';

ThemeData buildDarkThemeData(BuildContext context) {
  return ThemeData(
      fontFamily: "Camby",
      textTheme: buildTextTheme(context),
      brightness: Brightness.dark,
      primaryColor: Color.fromRGBO(29, 31, 33, 1),
      primarySwatch: CustomColor.swatch,
      backgroundColor: Colors.white);
}
