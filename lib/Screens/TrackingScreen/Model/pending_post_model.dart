// To parse this JSON data, do
//
//     final pendingPostModel = pendingPostModelFromJson(jsonString);

import 'dart:convert';

List<PendingPostModel> pendingPostModelFromJson(String str) => List<PendingPostModel>.from(json.decode(str).map((x) => PendingPostModel.fromJson(x)));

String pendingPostModelToJson(List<PendingPostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingPostModel {
    PendingPostModel({
        required this.id,
        required this.user,
        this.location,
        this.category,
        required this.postObject,
        required this.responseCount,
        required this.created,
    });

    int id;
    User user;
    dynamic location;
    Category? category;
    List<PostObject> postObject;
    int responseCount;
    DateTime created;

    factory PendingPostModel.fromJson(Map<String, dynamic> json) => PendingPostModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        location: json["location"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        postObject: List<PostObject>.from(json["post_object"].map((x) => PostObject.fromJson(x))),
        responseCount: json["response_count"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "location": location,
        "category": category?.toJson(),
        "post_object": List<dynamic>.from(postObject.map((x) => x.toJson())),
        "response_count": responseCount,
        "created": created.toIso8601String(),
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created": created.toIso8601String(),
        "popularity": popularity,
        "parent": parent,
    };
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

    Map<String, dynamic> toJson() => {
        "category": category,
        "question": question,
        "location": location,
        "p_answer": pAnswer,
    };
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

    Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "is_superuser": isSuperuser,
        "full_name": fullName,
        "email": email,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
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
