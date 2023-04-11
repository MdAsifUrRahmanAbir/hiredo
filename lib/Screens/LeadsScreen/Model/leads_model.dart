// To parse this JSON data, do
//
//     final leadsModel = leadsModelFromJson(jsonString);

import 'dart:convert';

List<LeadsModel> leadsModelFromJson(String str) => List<LeadsModel>.from(json.decode(str).map((x) => LeadsModel.fromJson(x)));


class LeadsModel {
    LeadsModel({
        required this.id,
        required this.user,
        this.location,
        required this.category,
        required this.postObject,
        required this.responseCount,
        required this.created,
    });

    int id;
    User user;
    dynamic location;
    Category category;
    List<PostObject> postObject;
    int responseCount;
    DateTime created;

    factory LeadsModel.fromJson(Map<String, dynamic> json) => LeadsModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        location: json["location"],
        category: Category.fromJson(json["category"]),
        postObject: List<PostObject>.from(json["post_object"].map((x) => PostObject.fromJson(x))),
        responseCount: json["response_count"],
        created: DateTime.parse(json["created"]),
    );

   
}

class Category {
    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.created,
        required this.popularity,
        required this.parent,
    });

    int id;
    String name;
    String image;
    DateTime created;
    int popularity;
    int parent;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
        parent: json["parent"],
    );

   
}

class PostObject {
    PostObject({
        required this.category,
        required this.question,
        this.location,
        required this.pAnswer,
    });

    int category;
    int question;
    dynamic location;
    int pAnswer;

    factory PostObject.fromJson(Map<String, dynamic> json) => PostObject(
        category: json["category"],
        question: json["question"],
        location: json["location"],
        pAnswer: json["p_answer"],
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
