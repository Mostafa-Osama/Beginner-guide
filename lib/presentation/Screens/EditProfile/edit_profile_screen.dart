import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:flutter/material.dart';
import 'edit_personal_photo_and_cover.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const DefaultText(
          text: 'Edit Profile',
          textStyle: TextStyle(fontSize: 20,color: AppColors.whiteColor),
        ),
      ),
        body: ListView(
          children: [
            EditPersonalPhotoAndCover(),
          ],
        ),);
  }
}
