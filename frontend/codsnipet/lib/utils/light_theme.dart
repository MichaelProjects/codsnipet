import 'package:flutter/material.dart';

import 'customer_color.dart';
import 'text_theme.dart';

ThemeData buildLightThemeData(BuildContext context) {
  return ThemeData(
      fontFamily: "Camby",
      textTheme: buildTextTheme(context),
      primarySwatch: CustomColor.swatch,
      primaryColor: Colors.white,
      backgroundColor: Colors.white);
}
