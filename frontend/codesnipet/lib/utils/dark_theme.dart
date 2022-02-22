import 'package:flutter/material.dart';

import 'customer_color.dart';
import 'text_theme.dart';

ThemeData buildDarkThemeData(BuildContext context) {
  return ThemeData(
      fontFamily: "Camby",
      textTheme: buildTextTheme(context),
      brightness: Brightness.dark,
      primaryColor: Colors.black38,
      primarySwatch: CustomColor.swatch,
      backgroundColor: Colors.white);
}
