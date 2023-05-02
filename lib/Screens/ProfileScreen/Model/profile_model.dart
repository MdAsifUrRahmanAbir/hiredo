// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int id;
  User user;
  dynamic image;
  int credit;
  List<dynamic> badges;
  DateTime updatedAt;
  int percentageComplete;

  ProfileModel({
    required this.id,
    required this.user,
    this.image,
    required this.credit,
    required this.badges,
    required this.updatedAt,
    required this.percentageComplete,
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "image": image,
        "credit": credit,
        "badges": List<dynamic>.from(badges.map((x) => x)),
        "updated_at": updatedAt.toIso8601String(),
        "percentage_complete": percentageComplete,
      };
}

class User {
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
