import 'package:beginner_guide/core/constants/Strings/user_id.dart';
import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/core/size_config.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:beginner_guide/presentation/Screens/widgets/alert_dialog/private_chat_alert_dialog.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/Screens/widgets/snack_bar.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:beginner_guide/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:beginner_guide/presentation/cubit/chat_cubit/chat_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserWidget extends StatelessWidget {
   UserWidget({Key? key,required this.userModel}) : super(key: key);
 final UserModel userModel;
  final TextEditingController messageController = TextEditingController();


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
              BlocConsumer<ChatCubit,ChatStates>(
                listener: (context,state){
                  if(state is ChatSendMessageSuccessState){
                    defaultSnackBar(context: context,text: 'Sent Message Successfully',fontColor: AppColors.whiteColor,backGroundColor: AppColors.greenColor);
                  }
                  if(state is ChatSendMessageErrorState){
                    defaultSnackBar(context: context,text: 'There\'s an error happened please try again later ' ,fontColor: AppColors.whiteColor,backGroundColor: AppColors.redColor);
                  }
                },
                builder:(context,state)=> IconButton(onPressed: (){

                  privateChatAlertDialog(context: context, messageController: messageController, onPressed: () async {
                   await ChatCubit.get(context).sendMessage(receiverId: userModel.uid!, senderId: userId!, dateTime: DateTime.now().toString(), message: messageController.text.toString());
                   Navigator.pop(context);

                  });
                }, icon: const Icon(Icons.message)),
              ),
              IconButton(onPressed: (){
                AppCubit.get(context).sendFriendRequest(receiverId: userModel.uid,senderCurrentJob: userModel.currentJob,senderFirstName: userModel.firstName,senderLastName: userModel.lastName);
              }, icon: const Icon(Icons.person_add)),
            ],
          ),
        ),

    );
  }
}
