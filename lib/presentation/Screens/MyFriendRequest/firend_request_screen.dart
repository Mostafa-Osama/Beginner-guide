import 'package:beginner_guide/core/size_config.dart';

import 'package:beginner_guide/presentation/Screens/MyFriendRequest/friend_request_tab_bar.dart';

import 'package:beginner_guide/presentation/Screens/MyFriendRequest/received_friend_request/recieved_friend_request.dart';
import 'package:beginner_guide/presentation/Screens/MyFriendRequest/sent_friend_request/sent_friend_request.dart';
import 'package:beginner_guide/presentation/cubit/app_cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class FriendRequestScreen extends StatefulWidget {
  const FriendRequestScreen({Key? key}) : super(key: key);

  @override
  State<FriendRequestScreen> createState() => _FriendRequestScreenState();
}

class _FriendRequestScreenState extends State<FriendRequestScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AppCubit.get(context).getAllReceivedFriendRequest();

    AppCubit.get(context).getAllSentFriendRequest();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.sizeConfigInit(context);
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(

                  children: [
                    const FriendRequestTabBar(),
                    SizedBox(height: SizeConfig.screenHeight!*0.015),
                    SizedBox(
                      height: SizeConfig.screenHeight!*0.68,
                      child:  const TabBarView(
                        physics: NeverScrollableScrollPhysics(),

                        children: [
                          ReceivedFriendRequest(),
                          SentFriendRequest(),
                        ],
                        // physics: NeverScrollableScrollPhysics(),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
    );}
}
