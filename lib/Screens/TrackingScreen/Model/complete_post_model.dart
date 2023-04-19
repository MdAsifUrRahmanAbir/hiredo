// To parse this JSON data, do
//
//     final completePostModel = completePostModelFromJson(jsonString);

import 'dart:convert';

List<CompletePostModel> completePostModelFromJson(String str) => List<CompletePostModel>.from(json.decode(str).map((x) => CompletePostModel.fromJson(x)));

String completePostModelToJson(List<CompletePostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompletePostModel {
    CompletePostModel({
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

    factory CompletePostModel.fromJson(Map<String, dynamic> json) => CompletePostModel(
        id: json["id"],
        post: Post.fromJson(json["post"]),
        profileName: json["profile_name"],
        userId: json["userId"],
        profile: Profile.fromJson(json["profile"]),
        rating: json["rating"],
        requestAccepted: json["request_accepted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "post": post.toJson(),
        "profile_name": profileName,
        "userId": userId,
        "profile": profile.toJson(),
        "rating": rating,
        "request_accepted": requestAccepted,
    };
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
    List<PostObject> postObject;
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
        postObject: List<PostObject>.from(json["post_object"].map((x) => PostObject.fromJson(x))),
        responseCount: json["response_count"],
        postCredit: json["post_credit"],
        created: DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "category": category.toJson(),
        "post_object": List<dynamic>.from(postObject.map((x) => x.toJson())),
        "response_count": responseCount,
        "post_credit": postCredit,
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
        this.parent,
    });

    int id;
    String name;
    String image;
    DateTime created;
    int popularity;
    dynamic parent;

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
        required this.id,
        this.location,
        required this.created,
        required this.postUser,
        required this.category,
        required this.question,
        required this.pAnswer,
    });

    int id;
    dynamic location;
    DateTime created;
    PostUser postUser;
    Category category;
    Question question;
    PAnswer pAnswer;

    factory PostObject.fromJson(Map<String, dynamic> json) => PostObject(
        id: json["id"],
        location: json["location"],
        created: DateTime.parse(json["created"]),
        postUser: PostUser.fromJson(json["post_user"]),
        category: Category.fromJson(json["category"]),
        question: Question.fromJson(json["question"]),
        pAnswer: PAnswer.fromJson(json["p_answer"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "created": created.toIso8601String(),
        "post_user": postUser.toJson(),
        "category": category.toJson(),
        "question": question.toJson(),
        "p_answer": pAnswer.toJson(),
    };
}

class PAnswer {
    PAnswer({
        required this.id,
        required this.options,
        required this.credit,
        required this.created,
        required this.question,
    });

    int id;
    String options;
    int credit;
    DateTime created;
    int question;

    factory PAnswer.fromJson(Map<String, dynamic> json) => PAnswer(
        id: json["id"],
        options: json["options"],
        credit: json["credit"],
        created: DateTime.parse(json["created"]),
        question: json["question"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "options": options,
        "credit": credit,
        "created": created.toIso8601String(),
        "question": question,
    };
}

class PostUser {
    PostUser({
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

    factory PostUser.fromJson(Map<String, dynamic> json) => PostUser(
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

class Question {
    Question({
        required this.id,
        required this.qs,
        required this.cat,
    });

    int id;
    String qs;
    int cat;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        qs: json["qs"],
        cat: json["cat"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "qs": qs,
        "cat": cat,
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
    UserProfilePic userProfilePic;
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
        userProfilePic: UserProfilePic.fromJson(json["user_profile_pic"]),
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
        "user_profile_pic": userProfilePic.toJson(),
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
    dynamic image;
    int credit;
    DateTime updatedAt;
    int user;
    List<dynamic> badges;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        image: json["image"],
        credit: json["credit"],
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
        badges: List<dynamic>.from(json["badges"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "credit": credit,
        "updated_at": updatedAt.toIso8601String(),
        "user": user,
        "badges": List<dynamic>.from(badges.map((x) => x)),
    };
}
