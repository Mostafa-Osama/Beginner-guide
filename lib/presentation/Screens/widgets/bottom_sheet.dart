import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

import 'default_text.dart';


showDefaultBottomSheet({required BuildContext context,required Color backgroundColor,required String text,required int duration}){
  return                               Scaffold.of(context).showBottomSheet((context) =>  SnackBar(
    backgroundColor: backgroundColor,
    duration: Duration(seconds: duration),
    content: DefaultText(
      text: text,
      textStyle: const TextStyle(fontSize: 12,color: AppColors.whiteColor),
    ),
  ));

}
