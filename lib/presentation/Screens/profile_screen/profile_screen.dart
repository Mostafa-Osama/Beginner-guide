import 'package:beginner_guide/presentation/Screens/HomeScreen/users/info_card.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/users/personal_photo_and_cover.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/users/user_posts.dart';
import 'package:beginner_guide/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(

children: [
  PersonalPhotoAndCover(userModel: AuthenticationCubit.get(context).profileData!),
  const SizedBox(height: 30,),
  Padding(
    padding:  const EdgeInsets.symmetric(horizontal: 15.0),
    child:  Column(
      children: [
        InfoCard(userModel: AuthenticationCubit.get(context).profileData!,),
        const SizedBox(height: 20,),
        const UserPosts(),
      ],
    ),
  )
],      ),
    );
  }
}
