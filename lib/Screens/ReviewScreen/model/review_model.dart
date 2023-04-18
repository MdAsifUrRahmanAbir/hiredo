// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    required this.result,
    required this.avgRating,
  });

  Result result;
  int avgRating;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        result: Result.fromJson(json["result"]),
        avgRating: json["avg_rating"],
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "avg_rating": avgRating,
      };
}

class ReviewsReceived {
  ReviewsReceived({
    required this.id,
    required this.reviewedBy,
    required this.reviewedUser,
    required this.rating,
    required this.comment,
  });

  int id;
  Result reviewedBy;
  int reviewedUser;
  int rating;
  String comment;

  factory ReviewsReceived.fromJson(Map<String, dynamic> json) =>
      ReviewsReceived(
        id: json["id"],
        reviewedBy: Result.fromJson(json["reviewed_by"]),
        reviewedUser: json["reviewed_user"],
        rating: json["rating"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reviewed_by": reviewedBy.toJson(),
        "reviewed_user": reviewedUser,
        "rating": rating,
        "comment": comment,
      };
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
  UserProfilePic? userProfilePic;
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
        reviewsReceived: json["reviews_received"] == null
            ? []
            : List<ReviewsReceived>.from(json["reviews_received"]!
                .map((x) => ReviewsReceived.fromJson(x))),
        userProfilePic: json["user_profile_pic"] == null
            ? null
            : UserProfilePic.fromJson(json["user_profile_pic"]),
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "phone_number": phoneNumber,
        "corporation_name": corporationName,
        "corporation_number": corporationNumber,
        "is_professional": isProfessional,
        "is_user": isUser,
        "reviews_received": reviewsReceived == null
            ? []
            : List<dynamic>.from(reviewsReceived!.map((x) => x.toJson())),
        "user_profile_pic": userProfilePic?.toJson(),
        "password": password,
      };
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "picture": picture,
      };
}
