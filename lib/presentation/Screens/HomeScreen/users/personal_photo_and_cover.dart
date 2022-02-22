import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:flutter/material.dart';


class PersonalPhotoAndCover extends StatelessWidget {
  final UserModel? userModel;

  const PersonalPhotoAndCover({Key? key, required this.userModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight! * 0.45,
          color: AppColors.whiteColor,
          child: Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight! * 0.3,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.whiteColor,
                        AppColors.whiteColor,
                        AppColors.greyColor.withOpacity(0.5),
                        AppColors.greyColor,
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: SizeConfig.screenHeight! * 0.2,
                        width: SizeConfig.screenWidth! * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.blackColor, width: 3),
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: SizeConfig.screenWidth! * 0.2,
                          child: Icon(
                            Icons.person,
                            color: AppColors.greyColor,
                            size: SizeConfig.screenWidth! * 0.3,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultText(
                              text: '${userModel!.firstName} '
                                  '${userModel!.lastName}',
                              textStyle: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 20,
                              ),
                            ),
                            DefaultText(
                              text: '${userModel!.currentJob}',
                              textStyle: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
