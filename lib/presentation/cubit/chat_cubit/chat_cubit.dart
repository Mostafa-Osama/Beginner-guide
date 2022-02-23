import 'package:beginner_guide/core/constants/Strings/user_id.dart';
import 'package:beginner_guide/data/models/message_model.dart';
import 'package:beginner_guide/data/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  sendMessage({
    required String receiverId,
    required String senderId,
    required String dateTime,
    required String message,
    // required String type,
    String? photo,
  }) {
    emit(ChatSendMessageLoadingState());
    MessageModel messageModel = MessageModel(
      message: message,
      senderId: senderId,
      receiverId: receiverId,
      dateTime: dateTime,
      //  type: type,
      //   photoUrl: photo!,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(ChatSendMessageSuccessState());
    }).catchError((onError) {
      emit(ChatSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(senderId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(ChatSendToMessageSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ChatSendToMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  getChats({required String? senderId, required String? receiverId}) {
    emit(GetChatsLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .listen((event) {
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
      }

      emit(GetChatsSuccessState());
    });
  }

  getAllChats({required String? senderId, required String? receiverId}) {
    emit(GetChatsLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .get()
        .then((value) {
      for (var element in value.docs) {
        print(element.id);
        getDataForAllUsersIHaveChatWith(userId: element.id);
      }
    }).catchError((getAllChatsError) {});
  }

  List<UserModel> allUsersIHaveChatWith = [];

  getDataForAllUsersIHaveChatWith({required String? userId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
          allUsersIHaveChatWith.add(UserModel.fromJson(value.data()!));
    })
        .catchError((onError) {});
  }
}
