import 'package:beginner_guide/core/constants/Strings/user_id.dart';
import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/Screens/widgets/snack_bar.dart';
import 'package:beginner_guide/presentation/Screens/widgets/text_field/default_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPersonalPhotoAndCover extends StatelessWidget {
  final TextEditingController emailEditController =
      TextEditingController(text: userEmail);
  final TextEditingController firstNameEditController =
      TextEditingController(text: userFirstName);
  final TextEditingController lastNameEditController =
      TextEditingController(text: userLastName);
  final TextEditingController addressEditController =
      TextEditingController(text: userAddress);
  final TextEditingController experienceEditController =
      TextEditingController(text: userExperience);
  final TextEditingController currentJobEditController =
      TextEditingController(text: userCurrentJob);
  final TextEditingController passwordEditController = TextEditingController();

  EditPersonalPhotoAndCover({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DefaultText(
                text: 'Email',
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                suffixIcon: Icons.edit,
                onPressedSuffixIcon: () {
                  if (userEmail != emailEditController.text.toString()) {
                    defaultSnackBar(
                        context: context,
                        text: 'Edit Email Done Successfully',
                        backGroundColor: AppColors.greenColor);
                  } else {
                    defaultSnackBar(
                        context: context,
                        text: 'Please Insert New Email For Edit',
                        backGroundColor: AppColors.redColor);
                  }
                },
                textEditingController: emailEditController,
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultText(
                text: 'First Name',
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                textEditingController: firstNameEditController,
                suffixIcon: Icons.edit,
                onPressedSuffixIcon: () {
                  if (userFirstName !=
                      firstNameEditController.text.toString()) {
                    defaultSnackBar(
                        context: context,
                        text: 'Edit First Name Done Successfully',
                        backGroundColor: AppColors.greenColor);
                  } else {
                    defaultSnackBar(
                        context: context,
                        text: 'Please Insert New First Name For Edit',
                        backGroundColor: AppColors.redColor);
                  }
                },
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultText(
                text: 'Last Name',
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                textEditingController: lastNameEditController,
                suffixIcon: Icons.edit,
                onPressedSuffixIcon: () {
                  if (userLastName != lastNameEditController.text.toString()) {
                    defaultSnackBar(
                        context: context,
                        text: 'Edit Last Name Done Successfully',
                        backGroundColor: AppColors.greenColor);
                  } else {
                    defaultSnackBar(
                        context: context,
                        text: 'Please Insert New Last Name For Edit',
                        backGroundColor: AppColors.redColor);
                  }
                },
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultText(
                text: 'Address',
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                textEditingController: addressEditController,
                suffixIcon: Icons.edit,
                onPressedSuffixIcon: () {
                  if (userAddress != addressEditController.text.toString()) {
                    defaultSnackBar(
                        context: context,
                        text: 'Edit Address Done Successfully',
                        backGroundColor: AppColors.greenColor);
                  } else {
                    defaultSnackBar(
                        context: context,
                        text: 'Please Insert New Address For Edit',
                        backGroundColor: AppColors.redColor);
                  }
                },
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultText(
                text: 'Current Job',
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                textEditingController: currentJobEditController,
                suffixIcon: Icons.edit,
                onPressedSuffixIcon: () {
                  if (userCurrentJob !=
                      currentJobEditController.text.toString()) {
                    defaultSnackBar(
                        context: context,
                        text: 'Edit Current Done Successfully',
                        backGroundColor: AppColors.greenColor);
                  } else {
                    defaultSnackBar(
                        context: context,
                        text: 'Please Insert New Current Job For Edit',
                        backGroundColor: AppColors.redColor);
                  }
                },
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultText(
                text: 'Experience',
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                textEditingController: experienceEditController,
                suffixIcon: Icons.edit,
                onPressedSuffixIcon: () {
                  if (userExperience !=
                      experienceEditController.text.toString()) {
                    defaultSnackBar(
                        context: context,
                        text: 'Edit Experience Done Successfully',
                        backGroundColor: AppColors.greenColor);
                  } else {
                    defaultSnackBar(
                        context: context,
                        text: 'Please Insert New Experience For Edit',
                        backGroundColor: AppColors.redColor);
                  }
                },
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 20,
              ),
              const DefaultText(
                text: 'Password',
                textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                textEditingController: passwordEditController,
                suffixIcon: Icons.edit,
                onPressedSuffixIcon: () {
                  if (passwordEditController.text.toString().isEmpty) {
                    defaultSnackBar(
                        context: context,
                        text: 'Please Insert New Password For Edit',
                        backGroundColor: AppColors.redColor);
                  } else {
                    defaultSnackBar(
                        context: context,
                        text: 'Edit Password Done Successfully',
                        backGroundColor: AppColors.greenColor);
                  }
                },
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
