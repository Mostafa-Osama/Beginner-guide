class UserModel {
  String? firstName;
  String? lastName;
  String? address;
  String? phone;
  String? email;
  String? uid;
  String? currentJob;
  String? jobExperience;
  String? personalPhoto;
  String? coverPhoto;

  UserModel(
      {required this.firstName,
        required this.lastName,
        required this.address,
        required this.phone,
        required this.email,
        required this.uid,
        required this.currentJob,
        required this.jobExperience,
         this.personalPhoto,
         this.coverPhoto,

      });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    address = json['address'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    uid = json['uid'];
    currentJob = json['currentJob'];
    jobExperience = json['jobExperience'];
    personalPhoto = json['personalPhoto'];
    coverPhoto = json['coverPhoto'];
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
      'phone': phone,
      'email': email,
      'uid': uid,
      'currentJob': currentJob,
      'jobExperience': jobExperience,
      'personalPhoto': personalPhoto,
      'coverPhoto': coverPhoto,
    };
  }
}
