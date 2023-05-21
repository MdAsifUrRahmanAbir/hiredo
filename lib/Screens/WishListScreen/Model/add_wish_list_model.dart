// To parse this JSON data, do
//
//     final addWishListModel = addWishListModelFromJson(jsonString);

import 'dart:convert';

List<AddWishListModel> addWishListModelFromJson(String str) =>
    List<AddWishListModel>.from(
        json.decode(str).map((x) => AddWishListModel.fromJson(x)));



class AddWishListModel {
  AddWishListModel({
    required this.id,
    required this.user,
    required this.wishedUser,
    this.productRatingAvg,
  });

  int id;
  User user;
  WishedUser wishedUser;
  dynamic productRatingAvg;

  factory AddWishListModel.fromJson(Map<String, dynamic> json) =>
      AddWishListModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        wishedUser: WishedUser.fromJson(json["wished_user"]),
        productRatingAvg: json["product_rating_avg"],
      );

 
}

class User {
  User({
    required this.id,
    required this.password,
    required this.isSuperuser,
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    required this.corporationName,
    required this.corporationNumber,
    required this.phoneNumber,
    required this.lastLogin,
    required this.joinDate,
    required this.isActive,
    required this.isStaff,
    required this.isAdmin,
    required this.isUser,
    required this.isProfessional,
    this.otpSecret,
    this.otp,
    this.otpExpireTime,
    required this.groups,
    required this.userPermissions,
  });

  int id;
  String password;
  bool isSuperuser;
  String fullName;
  String email;
  DateTime dateOfBirth;
  String corporationName;
  String corporationNumber;
  String phoneNumber;
  DateTime lastLogin;
  DateTime joinDate;
  bool isActive;
  bool isStaff;
  bool isAdmin;
  bool isUser;
  bool isProfessional;
  dynamic otpSecret;
  dynamic otp;
  dynamic otpExpireTime;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        isSuperuser: json["is_superuser"],
        fullName: json["full_name"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
        phoneNumber: json["phone_number"],
        lastLogin: DateTime.parse(json["last_login"]),
        joinDate: DateTime.parse(json["join_date"]),
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        isAdmin: json["is_admin"],
        isUser: json["is_user"],
        isProfessional: json["is_professional"],
        otpSecret: json["otp_secret"],
        otp: json["otp"],
        otpExpireTime: json["otp_expire_time"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "is_superuser": isSuperuser,
        "full_name": fullName,
        "email": email,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "corporation_name": corporationName,
        "corporation_number": corporationNumber,
        "phone_number": phoneNumber,
        "last_login": lastLogin.toIso8601String(),
        "join_date": joinDate.toIso8601String(),
        "is_active": isActive,
        "is_staff": isStaff,
        "is_admin": isAdmin,
        "is_user": isUser,
        "is_professional": isProfessional,
        "otp_secret": otpSecret,
        "otp": otp,
        "otp_expire_time": otpExpireTime,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions.map((x) => x)),
      };
}

class WishedUser {
  WishedUser({
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
 
  String email;
  DateTime dateOfBirth;
  String phoneNumber;
  String corporationName;
  String corporationNumber;
  bool isProfessional;
  bool isUser;
  String password;

  factory WishedUser.fromJson(Map<String, dynamic> json) => WishedUser(
        id: json["id"],
        fullName: json["full_name"],
       
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phoneNumber: json["phone_number"],
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
        isProfessional: json["is_professional"],
        isUser: json["is_user"],
        password: json["password"],
      );

  
}