import 'package:beginner_guide/core/constants/Strings/user_id.dart';
import 'package:beginner_guide/presentation/Screens/widgets/alert_dialog/private_chat_alert_dialog.dart';
import 'package:beginner_guide/presentation/cubit/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';

class SendPrivateMessage extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();
  final String receiverId;
   SendPrivateMessage({Key? key,required this.receiverId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return privateChatAlertDialog(context: context, messageController: messageController, onPressed: (){
      ChatCubit.get(context).sendMessage(receiverId: receiverId, senderId: userId!, dateTime: DateTime.now().toString(), message: messageController.text.toString());
      Navigator.pop(context);
    });
  }
}
