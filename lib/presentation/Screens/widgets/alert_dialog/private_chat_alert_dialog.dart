import 'package:beginner_guide/core/constants/colors/colors.dart';
import 'package:beginner_guide/presentation/Screens/widgets/default_text.dart';
import 'package:beginner_guide/presentation/Screens/widgets/navigator.dart';
import 'package:beginner_guide/presentation/Screens/widgets/text_field/default_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

privateChatAlertDialog({required BuildContext context,required TextEditingController? messageController , required VoidCallback? onPressed}){
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Send Private Message'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              DefaultTextFormField(
                textEditingController: messageController,
                textInputType: TextInputType.emailAddress,
                defaultBorderRadius: 20,
                enabledBorderRadius: 20,
                enabledBorderSideColor: AppColors.defaultColor,
                hintText: 'Write a message',
                borderSideColor: AppColors.defaultColor,
                fillColor: AppColors.whiteColor,
              )
            ],
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.defaultColor,
                    child: TextButton(
                        onPressed: () {
                          pop(context: context);
                        },
                        child: const Text('Close',style: TextStyle(color: AppColors.whiteColor),)),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    color: AppColors.defaultColor,

                    child: TextButton(
                      onPressed: onPressed,
                      child:const Text('Send',style: TextStyle(color: AppColors.whiteColor),),
                    ),
                  ),
                ),
              ],
            )
          ],

        );
      });
}