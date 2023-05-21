// To parse this JSON data, do
//
//     final myResponseSearchModel = myResponseSearchModelFromJson(jsonString);

import 'dart:convert';

List<MyResponseSearchModel> myResponseSearchModelFromJson(String str) => List<MyResponseSearchModel>.from(json.decode(str).map((x) => MyResponseSearchModel.fromJson(x)));

class MyResponseSearchModel {
    int id;
    PostUserClass user;
    Posts posts;
    String status;
    String createdAt;

    MyResponseSearchModel({
        required this.id,
        required this.user,
        required this.posts,
        required this.status,
        required this.createdAt,
    });

    factory MyResponseSearchModel.fromJson(Map<String, dynamic> json) => MyResponseSearchModel(
        id: json["id"],
        user: PostUserClass.fromJson(json["user"]),
        posts: Posts.fromJson(json["posts"]),
        status: json["status"],
        createdAt: json["created_at"],
    );

   
}

class Posts {
    int id;
    PostsUser user;
    String location;
    String latitude;
    String longitude;
    Category category;
    List<PostObject> postObject;
    int responseCount;
    int postCredit;
    DateTime created;

    Posts({
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

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"],
        user: PostsUser.fromJson(json["user"]),
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        category: Category.fromJson(json["category"]),
        postObject: List<PostObject>.from(json["post_object"].map((x) => PostObject.fromJson(x))),
        responseCount: json["response_count"],
        postCredit: json["post_credit"],
        created: DateTime.parse(json["created"]),
    );

  
}

class Category {
    int id;
    String name;
    String image;
    DateTime created;
    int popularity;
    dynamic parent;

    Category({
        required this.id,
        required this.name,
        required this.image,
        required this.created,
        required this.popularity,
        this.parent,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"]!,
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
        parent: json["parent"],
    );

}



class PostObject {
    int id;
    dynamic location;
    DateTime created;
    PostUserClass postUser;
    Category category;
    Question question;
    PAnswer pAnswer;

    PostObject({
        required this.id,
        this.location,
        required this.created,
        required this.postUser,
        required this.category,
        required this.question,
        required this.pAnswer,
    });

    factory PostObject.fromJson(Map<String, dynamic> json) => PostObject(
        id: json["id"],
        location: json["location"],
        created: DateTime.parse(json["created"]),
        postUser: PostUserClass.fromJson(json["post_user"]),
        category: Category.fromJson(json["category"]),
        question: Question.fromJson(json["question"]),
        pAnswer: PAnswer.fromJson(json["p_answer"]),
    );

   
}

class PAnswer {
    int id;
    String options;
    int credit;
    DateTime created;
    int question;

    PAnswer({
        required this.id,
        required this.options,
        required this.credit,
        required this.created,
        required this.question,
    });

    factory PAnswer.fromJson(Map<String, dynamic> json) => PAnswer(
        id: json["id"],
        options: json["options"],
        credit: json["credit"],
        created: DateTime.parse(json["created"]),
        question: json["question"],
    );

   
}

class PostUserClass {
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

    PostUserClass({
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

    factory PostUserClass.fromJson(Map<String, dynamic> json) => PostUserClass(
        id: json["id"],
        password: json["password"],
        isSuperuser: json["is_superuser"],
        fullName:json["full_name"],
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






class Question {
    int id;
    String qs;
    int cat;

    Question({
        required this.id,
        required this.qs,
        required this.cat,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        qs: json["qs"],
        cat: json["cat"],
    );

}



class PostsUser {
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

    PostsUser({
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

    factory PostsUser.fromJson(Map<String, dynamic> json) => PostsUser(
        id: json["id"],
        fullName: json["full_name"],
        userProfilePic: json["user_profile_pic"] ,
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






