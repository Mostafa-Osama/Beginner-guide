import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';

AppBar defaultAppBar({BuildContext ?context, Widget? title,Color?textColor,Color?appBarColor}) {
  return AppBar(
    title: title!,
    centerTitle: true,
    backgroundColor: appBarColor,
    elevation: 0.0,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context!).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColors.whiteColor,
      ),
    ),
  );
}
