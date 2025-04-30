import 'package:flutter/material.dart';

class LightTheme {
  var light = ThemeData(
    useMaterial3: true,
    fontFamily: "Quicksand",
    colorScheme: ColorScheme.light(
      onPrimary: Color.fromRGBO(242, 244, 247, 1),
      onSecondary: Color.fromRGBO(255, 254, 255, 1),
      onSecondaryContainer: Color.fromRGBO(109, 114, 116, 1),
      onPrimaryContainer: Color.fromRGBO(177, 179, 183, 1),
      onTertiary: Color.fromRGBO(0, 132, 255, 1),
    ),
  );
}
