import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/data/models/friend_request_model.dart';
import 'package:beginner_guide/presentation/Screens/widgets/buttons/default_text_button.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:flutter/material.dart';

class SentFriendRequestWidget extends StatelessWidget {
  final FriendRequestModel ?friendRequestModel;
  const SentFriendRequestWidget({Key? key,required this.friendRequestModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      borderOnForeground: true,
      child: SizedBox(
        height: SizeConfig.screenHeight!*0.14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/user/empty_image.png',height: SizeConfig.screenHeight!*0.1,),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(text: '${friendRequestModel!.firstName} ${friendRequestModel!.lastName}',textStyle:const TextStyle(color: AppColors.blackColor,fontSize: 15),),
                DefaultText(text: '${friendRequestModel!.currentJob}',textStyle:const TextStyle(color: AppColors.blackColor,fontSize: 15),),
               const DefaultText(text: 'Since 1 day',textStyle: TextStyle(color: AppColors.blackColor,fontSize: 15),),
              ],
            ),


          ],
        ),
      ),

    );
  }
}
