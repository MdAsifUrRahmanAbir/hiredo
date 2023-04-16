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

    dynamic id;
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

    dynamic id;
    dynamic reviewedBy;
    dynamic reviewedUser;
    dynamic rating;
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
        required this.created,
        required this.updated,
    });

    dynamic id;
    User user;
    ServiceName serviceName;
    String serviceDescription;
    DateTime created;
    DateTime updated;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        user: User.fromJson(json["user"]),
        serviceName: ServiceName.fromJson(json["service_name"]),
        serviceDescription: json["service_description"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "service_name": serviceName.toJson(),
        "service_description": serviceDescription,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
    };
}

class ServiceName {
    ServiceName({
        required this.id,
        required this.name,
        required this.image,
        required this.created,
        required this.popularity,
        required this.parent,
    });

    dynamic id;
    String name;
    String image;
    DateTime created;
    dynamic popularity;
    dynamic parent;

    factory ServiceName.fromJson(Map<String, dynamic> json) => ServiceName(
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

    dynamic id;
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

class UserProfilePic {
    UserProfilePic({
        required this.id,
        required this.user,
        required this.picture,
    });

    dynamic id;
    dynamic user;
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
