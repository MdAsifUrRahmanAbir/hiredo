// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

String serviceModelToJson(List<ServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceModel {
    ServiceModel({
        required this.id,
        required this.user,
        required this.serviceName,
        required this.serviceDescription,
        required this.created,
        required this.updated,
    });

    int id;
    User user;
    ServiceName serviceName;
    String serviceDescription;
    DateTime created;
    DateTime updated;

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
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

    int id;
    String name;
    String image;
    DateTime created;
    int popularity;
    int parent;

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
