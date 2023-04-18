// To parse this JSON data, do
//
//     final leadSearchModel = leadSearchModelFromJson(jsonString);

import 'dart:convert';

import 'leads_model.dart';

LeadSearchModel leadSearchModelFromJson(String str) => LeadSearchModel.fromJson(json.decode(str));


class LeadSearchModel {
    LeadSearchModel({
        required this.result,
    });

    List<Result> result;

    factory LeadSearchModel.fromJson(Map<String, dynamic> json) => LeadSearchModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    
}


class Category {
    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.created,
        required this.popularity,
        this.parent,
    });

    int id;
    String name;
    String image;
    DateTime created;
    int popularity;
    Category? parent;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
        parent: json["parent"] == null ? null : Category.fromJson(json["parent"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created": created.toIso8601String(),
        "popularity": popularity,
        "parent": parent?.toJson(),
    };
}

class User {
    User({
        required this.id,
        required this.fullName,
        this.userProfilePic,
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
    dynamic userProfilePic;
    String email;
    DateTime dateOfBirth;
    String phoneNumber;
    String corporationName;
    String corporationNumber;
    bool isProfessional;
    bool isUser;
    String password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        userProfilePic: json["user_profile_pic"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phoneNumber: json["phone_number"],
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
        isProfessional: json["is_professional"],
        isUser: json["is_user"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "user_profile_pic": userProfilePic,
        "email": email,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "phone_number": phoneNumber,
        "corporation_name": corporationName,
        "corporation_number": corporationNumber,
        "is_professional": isProfessional,
        "is_user": isUser,
        "password": password,
    };
}
