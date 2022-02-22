import 'package:flutter/cupertino.dart';

class PostModel{
  String?title;
  String?date;
  String?body;



  PostModel({
    required this.title,
    required this.date,
    required this.body,
});


  PostModel.fromJson(Map<String,dynamic> json){
    title = json['title'];
    date = json['date'];
    body = json['body'];
  }

  Map<String, dynamic> toMap(){
    return{
      'title':title,
      'date':date,
      'body':body,
    };
  }

}