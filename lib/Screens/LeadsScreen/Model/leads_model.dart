// To parse this JSON data, do
//
//     final leadModel = leadModelFromJson(jsonString);

import 'dart:convert';

LeadModel leadModelFromJson(String str) => LeadModel.fromJson(json.decode(str));



class LeadModel {
    LeadModel({
        required this.result,
        required this.page,
        required this.totalPages,
        required this.totalResults,
    });

    List<Result> result;
    int page;
    int totalPages;
    int totalResults;

    factory LeadModel.fromJson(Map<String, dynamic> json) => LeadModel(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        page: json["page"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

  
}

class Result {
    Result({
        required this.id,
        required this.user,
        required this.location,
         this.latitude,
         this.longitude,
        required this.category,
        required this.postObject,
        required this.responseCount,
        required this.postCredit,
        required this.created,
    });

    int id;
    User user;
    String location;
    String? latitude;
    String?  longitude;
    Category category;
    List<PostObject> postObject;
    int responseCount;
    int postCredit;
    String created;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        user: User.fromJson(json["user"]),
        location: json["location"],
        latitude: json["latitude"]??"",
        longitude: json["longitude"]??"",
        category: Category.fromJson(json["category"]),
        postObject: List<PostObject>.from(json["post_object"].map((x) => PostObject.fromJson(x))),
        responseCount: json["response_count"],
        postCredit: json["post_credit"],
        created:json["created"],
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
    dynamic parent;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
        parent: json["parent"],
    );

   
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
        userProfilePic: json["user_profile_pic"]==null?null:UserProfilePic.fromJson(json["user_profile_pic"]),
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
class UserProfilePic {
    UserProfilePic({
         this.id,
         this.user,
         this.picture,
    });

    int? id;
    int? user;
    String? picture;

    factory UserProfilePic.fromJson(Map<String, dynamic> json) => UserProfilePic(
        id: json["id"],
        user: json["user"],
        picture: json["picture"],
    );

}


