import 'package:flutter/material.dart';

class DarkTheme {
  var dark = ThemeData(
    useMaterial3: true,
    fontFamily: "Roboto",
    colorScheme: ColorScheme.dark(
      onPrimary: Color.fromRGBO(21, 23, 25, 1),
      onSecondary: Color.fromRGBO(35, 38, 39, 1),
      onSecondaryContainer: Color.fromRGBO(109, 114, 119, 1),
      onPrimaryContainer: Color.fromRGBO(52, 56, 57, 1),
      onTertiary: Color.fromRGBO(0, 132, 255, 1),
      onTertiaryContainer: Color.fromRGBO(51, 50, 55, 1),
      onInverseSurface: Color.fromRGBO(35, 37, 39, 1),
    ),
  );
}
