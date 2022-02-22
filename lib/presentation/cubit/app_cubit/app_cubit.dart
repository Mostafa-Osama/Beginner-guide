import 'package:beginner_guide/core/constants/Strings/user_id.dart';
import 'package:beginner_guide/data/models/friend_request_model.dart';
import 'package:beginner_guide/data/models/post_model.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/home_screen/home_screen.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/interview/interview_screen.dart';
import 'package:beginner_guide/presentation/Screens/HomeScreen/users/users_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  int selectedIndex = 0;
  final FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;
  List<String> appBarTitle = <String>[
    'HomeScreen',
    'InterView Helper',
    'Users',
  ];

  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const InterViewScreen(),
    const UsersScreen(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    emit(BottomNavChange());
  }

  List<UserModel> allUsers = [];

  getAllUsers() {
    emit(GetAllUsersLoadingState());
    allUsers = [];
    _firebaseFireStore.collection('users').get().then((value) {
      for (var element in value.docs) {
        if (element.data()['uid'] != userId) {
          allUsers.add(UserModel.fromJson(element.data()));
        }
      }

      emit(GetAllUsersSuccessState());
    }).catchError((onError) {
      emit(GetAllUsersErrorState());
    });
  }

  List<PostModel> allPosts = [];


  getAllPosts({required String? userId}) {
    emit(GetAllPostsLoadingState());
    allPosts = [];
    _firebaseFireStore.collection('users').doc(userId).collection('posts').get().then((value) {
      for (var element in value.docs) {
        allPosts.add(PostModel.fromJson(element.data()));

      }

      emit(GetAllPostsSuccessState());
    }).catchError((onError) {
      emit(GetAllPostsErrorState());
    });
  }


  FriendRequestModel? _receivedFriendRequestModel;
  FriendRequestModel? _sentFriendRequestModel;

  sendFriendRequest(
      {String? receiverId,
      String? senderCurrentJob,
      String? senderFirstName,
      String? senderLastName}) {
    emit(SendFriendRequestLoadingState());

    _sentFriendRequestModel = FriendRequestModel(
        date: DateTime.now().toString(),
        lastName: senderLastName,
        firstName: senderFirstName,
        senderId: userId,
        receiverId: receiverId,
        currentJob: senderCurrentJob);
    _firebaseFireStore
        .collection('users')
        .doc(userId)
        .collection('sent friend request')
        .doc(receiverId)
        .set(_sentFriendRequestModel!.toMap())
        .then((value) {
      emit(SendFriendRequestSuccessState());

    _receivedFriendRequestModel = FriendRequestModel(
    date: DateTime.now().toString(),
    lastName: userLastName,
    firstName: userFirstName,
    senderId: userId,
    receiverId: receiverId,
    currentJob: userCurrentJob);
    _firebaseFireStore
        .collection('users')
        .doc(receiverId)
        .collection('received friend request')
        .doc(userId)
        .set(_receivedFriendRequestModel!.toMap())
          .then((value) {
      emit(ReceiveFriendRequestSuccessState());
    }
         )
          .catchError((onError) {
      emit(ReceiveFriendRequestErrorState());
    });
    }).catchError((onError) {
      emit(SendFriendRequestErrorState());
    });
  }
}
