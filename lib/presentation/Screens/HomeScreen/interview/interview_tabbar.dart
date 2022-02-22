import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:flutter/material.dart';


class InterViewTabBar extends StatelessWidget {
  const InterViewTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                Container(
      height: SizeConfig.screenHeight! * 0.1,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.defaultColor),

      ),
      child:
      TabBar(
        physics:const NeverScrollableScrollPhysics(),
        labelPadding: EdgeInsets.zero,
        indicator: ShapeDecoration(
          color: AppColors.defaultColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.defaultColor),
          ),
          //  color: AppColors.defaultColorOne,
        ),
        labelStyle: const TextStyle(fontSize: 12),
        tabs: const <Widget>[
          Tab(
              child: Center(
                child: DefaultText(
                  text: 'InterView Question',
                  textStyle:  TextStyle(fontSize: 15),),
              )),
          Tab(
              child: Center(
                child: DefaultText(
                  text: 'Problem Solving',
                  textStyle:  TextStyle(fontSize: 15),),
              )),

        ],
        unselectedLabelColor: AppColors.defaultColor,
        indicatorColor: AppColors.defaultColor,
        overlayColor: MaterialStateProperty.all(AppColors.defaultColor),
        labelColor: AppColors.whiteColor,
      ),
    );
  }
}
