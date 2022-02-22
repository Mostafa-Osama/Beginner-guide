import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  final Color ?color;
  const DefaultCircularProgressIndicator({Key? key,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color:color ?? AppColors.whiteColor,
      ),
    );
  }
}
