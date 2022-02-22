import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String ? text;
  final TextStyle ? textStyle;
  const DefaultText({Key? key, this.text, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: textStyle,
      softWrap: true,


    );
  }
}
