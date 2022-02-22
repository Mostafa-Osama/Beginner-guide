import 'dart:math';

import 'package:flutter/material.dart';

class AppColors{
static const Color defaultColor =Color(0xFF314450);
static const Color whiteColor =Color(0xFFF6F6F6);
static const Color blackColor =Color(0xFF000000);
static const Color blueColor =Color(0xFF3B3BFF);
static const Color orangeColor =Color(0xFFFFA73D);
static const Color redColor =Color(0xFFF60505);
static const Color greyColor =Color(0xFF898484);
static const Color lightGreenColor = Color(0xFF3F8E65);
static const Color lightGreenColorX2 = Color(0xFF9AF6C6);


}


MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);