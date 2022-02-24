import 'package:beginner_guide/presentation/Screens/MyFriendRequest/received_friend_request/received_friend_request_widget.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReceivedFriendRequest extends StatelessWidget {
  const ReceivedFriendRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => ListView.builder(
              itemBuilder: (context, index) => ReceivedFriendRequestWidget(
                friendRequestModel:
                    AppCubit.get(context).allReceivedFriendRequest[index],
              ),
              itemCount: AppCubit.get(context).allReceivedFriendRequest.length,
            ));
  }
}
