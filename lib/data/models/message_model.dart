class MessageModel{
  late String senderId;
  late String receiverId;
  late String dateTime;
   String? message;
 // late String type;
 // late String photoUrl;

  MessageModel({
    required this.senderId,
    required this.receiverId,
    required  this.dateTime,
    required this.message,
  //  required this.type,
  //  required this.photoUrl,
  });

  MessageModel.fromJson(Map<String ,dynamic>json){
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    message = json['message'];
  //  type = json['type'];
   // photoUrl = json['photo_url'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'senderId':senderId,
        'receiverId':receiverId,
        'dateTime':dateTime,
        'message':message,
    //    'type':type,
     //   'photo_url':photoUrl,
      };
  }
}

