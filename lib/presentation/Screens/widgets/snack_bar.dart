import 'package:flutter/material.dart';

defaultSnackBar(
    {required context, String?text, Color ?backGroundColor, double?fontSize,Color ?fontColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: const Duration(seconds: 2),content: Text(text!, style: TextStyle(
        fontSize: fontSize,
        color: fontColor
      ),), backgroundColor: backGroundColor,)
  );
}