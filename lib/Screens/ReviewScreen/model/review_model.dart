// To parse this JSON data, do
//
//     final reviewsModel = reviewsModelFromJson(jsonString);

import 'dart:convert';

ReviewsModel reviewsModelFromJson(String str) => ReviewsModel.fromJson(json.decode(str));



class ReviewsModel {
    ReviewsModel({
        required this.result,
        required this.avgRating,
    });

    Result result;
    double avgRating;

    factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
        result: Result.fromJson(json["result"]),
        avgRating: json["avg_rating"]??0,
    );

    
}

class ReviewsReceived {
    ReviewsReceived({
        required this.id,
        required this.reviewedBy,
        required this.reviewedUser,
        required this.rating,
        required this.comment,
        required this.created,
    });

    int id;
    Result reviewedBy;
    int reviewedUser;
    double rating;
    String comment;
    String created;

    factory ReviewsReceived.fromJson(Map<String, dynamic> json) => ReviewsReceived(
        id: json["id"],
        reviewedBy: Result.fromJson(json["reviewed_by"]),
        reviewedUser: json["reviewed_user"],
        rating: json["rating"],
        comment: json["comment"],
        created: json["created"]
    );

   
}

class Result {
    Result({
        required this.id,
        required this.fullName,
        required this.email,
        required this.dateOfBirth,
        required this.phoneNumber,
        required this.corporationName,
        required this.corporationNumber,
        required this.isProfessional,
        required this.isUser,
        this.reviewsReceived,
        this.userProfilePic,
        this.password,
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
    List<ReviewsReceived>? reviewsReceived;
    dynamic userProfilePic;
    String? password;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phoneNumber: json["phone_number"],
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
        isProfessional: json["is_professional"],
        isUser: json["is_user"],
        reviewsReceived: json["reviews_received"] == null ? [] : List<ReviewsReceived>.from(json["reviews_received"]!.map((x) => ReviewsReceived.fromJson(x))),
        userProfilePic: json["user_profile_pic"],
        password: json["password"],
    );

   
}
