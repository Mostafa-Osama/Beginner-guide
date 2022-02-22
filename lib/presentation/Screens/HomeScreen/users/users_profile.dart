import 'package:beginner_guide/data/models/user_model.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/users/personal_photo_and_cover.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/users/user_posts.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';


import 'info_card.dart';

class UsersProfile extends StatefulWidget {
  final UserModel ?userModel;
  const UsersProfile({Key? key,required this.userModel}) : super(key: key);

  @override
  State<UsersProfile> createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppCubit.get(context).getAllPosts(userId: widget.userModel!.uid);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView(
        children: [
           PersonalPhotoAndCover(userModel: widget.userModel,),
          const SizedBox(height: 30,),
           Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 15.0),
            child:  Column(
              children: [
                InfoCard(userModel: widget.userModel,),
                 const SizedBox(height: 20,),
                 const UserPosts(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
