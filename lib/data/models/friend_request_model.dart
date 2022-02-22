class FriendRequestModel{
  String ?date;
  String ?firstName;
  String ?lastName;
  String ?senderId;
  String ?receiverId;
  String ?currentJob;

  FriendRequestModel(
      {required this.date,
        required this.lastName,
        required this.firstName,
        required this.senderId,
        required this.receiverId,
        required this.currentJob,
      });

  FriendRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    date = json['date'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    currentJob = json['currentJob'];
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'date': date,
      'senderId': senderId,
      'receiverId': receiverId,
      'currentJob': currentJob,
    };
  }
}
