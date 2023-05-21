// To parse this JSON data, do
//
//     final pendingRequestListModel = pendingRequestListModelFromJson(jsonString);

import 'dart:convert';

List<PendingRequestListModel> pendingRequestListModelFromJson(String str) => List<PendingRequestListModel>.from(json.decode(str).map((x) => PendingRequestListModel.fromJson(x)));


class PendingRequestListModel {
    PendingRequestListModel({
        required this.id,
        required this.post,
        required this.profileName,
        required this.userId,
        required this.profile,
        required this.rating,
        required this.requestAccepted,
    });

    int id;
    Post post;
    String profileName;
    String userId;
    Profile profile;
    double rating;
    bool requestAccepted;

    factory PendingRequestListModel.fromJson(Map<String, dynamic> json) => PendingRequestListModel(
        id: json["id"],
        post: Post.fromJson(json["post"]),
        profileName: json["profile_name"],
        userId: json["userId"],
        profile: Profile.fromJson(json["profile"]),
        rating: json["rating"],
        requestAccepted: json["request_accepted"],
    );

   
}

class Post {
    Post({
        required this.id,
        required this.user,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.category,
        required this.postObject,
        required this.responseCount,
        required this.postCredit,
        required this.created,
    });

    int id;
    User user;
    String location;
    String latitude;
    String longitude;
    Category category;
    List<dynamic> postObject;
    int responseCount;
    int postCredit;
    DateTime created;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        user: User.fromJson(json["user"]),
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        category: Category.fromJson(json["category"]),
        postObject: List<dynamic>.from(json["post_object"].map((x) => x)),
        responseCount: json["response_count"],
        postCredit: json["post_credit"],
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
        required this.userProfilePic,
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

   
}

class Profile {
    Profile({
        required this.id,
        this.image,
        required this.credit,
        required this.updatedAt,
        required this.user,
        required this.badges,
    });

    int id;
    String? image;
    int credit;
    DateTime updatedAt;
    int user;
    List<int> badges;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        image: json["image"],
        credit: json["credit"],
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
        badges: List<int>.from(json["badges"].map((x) => x)),
    );

   
}
