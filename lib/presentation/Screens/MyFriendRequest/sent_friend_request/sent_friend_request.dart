import 'package:beginner_guide/presentation/Screens/MyFriendRequest/sent_friend_request/sent_friend_request_widget.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SentFriendRequest extends StatelessWidget {
  const SentFriendRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => ListView.builder(
              itemBuilder: (context, index) =>  SentFriendRequestWidget(friendRequestModel: AppCubit.get(context).allSentFriendRequest[index],),
              itemCount: AppCubit.get(context).allSentFriendRequest.length,
            ));
  }
}
