import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final String ?text;
  final double ?textFontSize;
  final FontWeight ?textFontWeight;
  final Color?textColor;
  const DefaultTextButton({Key? key,this.onPressed,this.textFontSize,this.textFontWeight,this.textColor,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text!,style: TextStyle(color:textColor,fontSize: textFontSize,fontWeight: textFontWeight ),),);
  }
}
