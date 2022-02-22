import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';


class UserWidget extends StatelessWidget {
  const UserWidget({Key? key,required this.userModel}) : super(key: key);
 final UserModel userModel;

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
                  DefaultText(text: '${userModel.firstName} ${userModel.lastName}',textStyle:const TextStyle(color: AppColors.blackColor,fontSize: 15),),
                  DefaultText(text: userModel.currentJob,textStyle:const TextStyle(color: AppColors.blackColor,fontSize: 15),),
               ],
             ),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.message)),
              IconButton(onPressed: (){
                AppCubit.get(context).sendFriendRequest(receiverId: userModel.uid,senderCurrentJob: userModel.currentJob,senderFirstName: userModel.firstName,senderLastName: userModel.lastName);
              }, icon: const Icon(Icons.person_add)),
            ],
          ),
        ),

    );
  }
}
