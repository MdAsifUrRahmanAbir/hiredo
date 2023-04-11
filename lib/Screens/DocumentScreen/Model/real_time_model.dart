// To parse this JSON data, do
//
//     final realTimeServiceModel = realTimeServiceModelFromJson(jsonString);

import 'dart:convert';

List<RealTimeServiceModel> realTimeServiceModelFromJson(String str) => List<RealTimeServiceModel>.from(json.decode(str).map((x) => RealTimeServiceModel.fromJson(x)));

String realTimeServiceModelToJson(List<RealTimeServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RealTimeServiceModel {
    RealTimeServiceModel({
        required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.corporationName,
        required this.locations,
        required this.services,
        required this.reviewsReceived,
        this.userProfilePic,
    });

    int id;
    String fullName;
    String email;
    String phoneNumber;
    String corporationName;
    List<dynamic> locations;
    List<Service> services;
    List<ReviewsReceived> reviewsReceived;
    UserProfilePic? userProfilePic;

    factory RealTimeServiceModel.fromJson(Map<String, dynamic> json) => RealTimeServiceModel(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        corporationName: json["corporation_name"],
        locations: List<dynamic>.from(json["locations"].map((x) => x)),
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        reviewsReceived: List<ReviewsReceived>.from(json["reviews_received"].map((x) => ReviewsReceived.fromJson(x))),
        userProfilePic: json["user_profile_pic"] == null ? null : UserProfilePic.fromJson(json["user_profile_pic"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "corporation_name": corporationName,
        "locations": List<dynamic>.from(locations.map((x) => x)),
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
        "reviews_received": List<dynamic>.from(reviewsReceived.map((x) => x.toJson())),
        "user_profile_pic": userProfilePic?.toJson(),
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
    int reviewedBy;
    int reviewedUser;
    double rating;
    String comment;

    factory ReviewsReceived.fromJson(Map<String, dynamic> json) => ReviewsReceived(
        id: json["id"],
        reviewedBy: json["reviewed_by"],
        reviewedUser: json["reviewed_user"],
        rating: json["rating"],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "reviewed_by": reviewedBy,
        "reviewed_user": reviewedUser,
        "rating": rating,
        "comment": comment,
    };
}

class Service {
    Service({
        required this.id,
        required this.user,
        required this.serviceName,
        required this.serviceDescription,
    });

    int id;
    int user;
    int serviceName;
    String serviceDescription;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        user: json["user"],
        serviceName: json["service_name"],
        serviceDescription: json["service_description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "service_name": serviceName,
        "service_description": serviceDescription,
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
