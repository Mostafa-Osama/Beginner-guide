import 'package:flutter/material.dart';


const double padding = 20.0;


class SizeConfig{

  static double? screenWidth;
  static double? screenHeight;
  static Orientation? orientation;
  static double ?defaultSize;
  static double ? textScale;



  static void sizeConfigInit(BuildContext context){
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    textScale = MediaQuery.of(context).textScaleFactor;

    defaultSize = orientation == Orientation.landscape?screenHeight!*0.024:screenWidth!*0.024;
  }
}