// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));



class ProfileModel {
  int? id;
  User? user;
  dynamic image;
  int? credit;
  List<dynamic>? badges;
  DateTime? updatedAt;
  int? percentageComplete;

  ProfileModel({
     this.id,
     this.user,
    this.image,
     this.credit,
     this.badges,
     this.updatedAt,
     this.percentageComplete,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        image: json["image"],
        credit: json["credit"],
        badges: List<dynamic>.from(json["badges"].map((x) => x)),
        updatedAt: DateTime.parse(json["updated_at"]),
        percentageComplete: json["percentage_complete"],
      );


}

class User {
  int id;
  String fullName;
  String email;
  DateTime dateOfBirth;
  String corporationName;
  String corporationNumber;
  String phoneNumber;
  bool isUser;
  bool isProfessional;


  User({
    required this.id,
   
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    required this.corporationName,
    required this.corporationNumber,
    required this.phoneNumber,
 
    required this.isUser,
    required this.isProfessional,
  
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
    
        fullName: json["full_name"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
        phoneNumber: json["phone_number"],
      
        isUser: json["is_user"],
        isProfessional: json["is_professional"],
      
      );

 
}
