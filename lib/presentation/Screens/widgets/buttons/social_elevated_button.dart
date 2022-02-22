import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import '../default_text.dart';

class SocialElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final double? buttonBorderRadius;

  final String? text;
  final TextStyle? textStyle;
  final String? image;
  final String? buttonText;

  const SocialElevatedButton(
      {Key? key,
      this.onPressed,
      this.buttonColor,
      this.buttonBorderColor,
      this.buttonBorderRadius,
      this.textStyle,
      this.text,
      this.image,
      this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            //
            side: BorderSide(color: buttonBorderColor!),
            // to set border radius to button
            borderRadius: BorderRadius.circular(buttonBorderRadius!),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              color: AppColors.whiteColor,
            ),
            const SizedBox(
              width: 20,
            ),
            DefaultText(
              text: buttonText,
              textStyle:
                  const TextStyle(color: AppColors.whiteColor, fontSize: 20),
            ),
          ],
        ));
  }
}
