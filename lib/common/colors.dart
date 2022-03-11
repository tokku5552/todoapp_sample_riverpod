import 'package:flutter/material.dart';

const MaterialColor colorCustom = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFF004fab),
    100: Color(0xFF004fab),
    200: Color(0xFF004fab),
    300: Color(0xFF004fab),
    400: Color(0xFF004fab),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF004fab),
    700: Color(0xFF004fab),
    800: Color(0xFF004fab),
    900: Color(0xFF004fab),
  },
);
const int _bluePrimaryValue = 0xFF004fab;

const MaterialColor complementaryColorCustom = MaterialColor(
  _blueComplementaryValue,
  <int, Color>{
    50: Color(0xFFffae1f),
    100: Color(0xFFffae1f),
    200: Color(0xFFffae1f),
    300: Color(0xFFffae1f),
    400: Color(0xFFffae1f),
    500: Color(_bluePrimaryValue),
    600: Color(0xFFffae1f),
    700: Color(0xFFffae1f),
    800: Color(0xFFffae1f),
    900: Color(0xFFffae1f),
  },
);
const int _blueComplementaryValue = 0xFFffae1f;
