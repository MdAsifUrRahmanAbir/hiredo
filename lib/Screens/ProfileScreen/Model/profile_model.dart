// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));



class ProfileModel {
    ProfileModel({
        required this.id,
        required this.user,
        this.image,
        required this.credit,
        required this.badges,
        required this.updatedAt,
    });

    int id;
    User user;
    dynamic image;
    int credit;
    List<Badge> badges;
    DateTime updatedAt;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        image: json["image"]??"",
        credit: json["credit"],
        badges: List<Badge>.from(json["badges"].map((x) => Badge.fromJson(x))),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

  
}

class Badge {
    Badge({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
        required this.longDescription,
        required this.created,
        required this.user,
    });

    int id;
    String title;
    String description;
    String image;
    String longDescription;
    DateTime created;
    int user;

    factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        longDescription: json["long_description"],
        created: DateTime.parse(json["created"]),
        user: json["user"],
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
        userPermissions: List<dynamic>.from(json["user_permissions"].map((x) => x)),
    );

   


}
