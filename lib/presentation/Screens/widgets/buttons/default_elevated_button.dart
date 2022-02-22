import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color?buttonColor;
  final Color?buttonBorderColor;
  final double? buttonBorderRadius;

  final String? text;
  final TextStyle? textStyle;
  final Color? textStyleColor;
  final FontWeight? textStyleFontWeight;
  final double? textStyleFontSize;

  const DefaultElevatedButton(
      {Key? key,
      this.onPressed,
        this.buttonColor,
        this.buttonBorderColor,
        this.buttonBorderRadius,
      this.textStyle,
      this.text,
      this.textStyleColor,
      this.textStyleFontWeight,
      this.textStyleFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        primary: buttonColor,
          shape: RoundedRectangleBorder( //
            side: BorderSide(color:buttonBorderColor! ),// to set border radius to button
            borderRadius: BorderRadius.circular(buttonBorderRadius!),
          ),

      ),
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
            color: textStyleColor,
            fontWeight: textStyleFontWeight,
            fontSize: textStyleFontSize,
          ),
        ));
  }
}
