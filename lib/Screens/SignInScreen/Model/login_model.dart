// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));



class LoginModel {
    LoginModel({
        required this.token,
        required this.message,
        required this.user,
    });

    String token;
    String message;
    User user;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

  
}

class User {
    User({
        required this.id,
        required this.fullName,
        
        required this.email,
        required this.dateOfBirth,
        required this.phoneNumber,
        required this.corporationName,
        required this.corporationNumber,
        required this.isProfessional,
        required this.isUser,
        required this.password,
    });

    int id;
    String fullName;
    UserProfilePic? userProfilePic;
    String email;
    String dateOfBirth;
    String phoneNumber;
    String corporationName;
    String corporationNumber;
    bool isProfessional;
    bool isUser;
    String password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
       
        email: json["email"],
        dateOfBirth: json["date_of_birth"],
        phoneNumber: json["phone_number"],
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
        isProfessional: json["is_professional"],
        isUser: json["is_user"],
        password: json["password"],
    );

 
}

class UserProfilePic {
    UserProfilePic({
        required this.id,
        required this.user,
        required this.picture,
    });

    int id;
    int user;
    String picture;

    factory UserProfilePic.fromJson(Map<String, dynamic> json) => UserProfilePic(
        id: json["id"],
        user: json["user"],
        picture: json["picture"],
    );

}
