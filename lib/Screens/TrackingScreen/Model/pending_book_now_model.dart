// // To parse this JSON data, do
// //
// //     final pendingBookNowModel = pendingBookNowModelFromJson(jsonString);

// import 'dart:convert';

// List<PendingBookNowModel> pendingBookNowModelFromJson(String str) =>
//     List<PendingBookNowModel>.from(
//         json.decode(str).map((x) => PendingBookNowModel.fromJson(x)));

// class PendingBookNowModel {
//   int id;
//   String location;
//   String latitude;
//   String longitude;
//   String created;
//   User user;
//   User bookedInUser;
//   Category category;
//   List<RealtimePostObject> realtimePostObject;

//   PendingBookNowModel({
//     required this.id,
//     required this.location,
//     required this.latitude,
//     required this.longitude,
//     required this.created,
//     required this.user,
//     required this.bookedInUser,
//     required this.category,
//     required this.realtimePostObject,
//   });

//   factory PendingBookNowModel.fromJson(Map<String, dynamic> json) =>
//       PendingBookNowModel(
//         id: json["id"],
//         location: json["location"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         created: json["created"],
//         user: User.fromJson(json["user"]),
//         bookedInUser: User.fromJson(json["booked_in_user"]),
//         category: Category.fromJson(json["category"]),
//         realtimePostObject: List<RealtimePostObject>.from(
//             json["realtime_post_object"]
//                 .map((x) => RealtimePostObject.fromJson(x))),
//       );
// }

// class User {
//   int id;

//   String fullName;
//   String email;
//   DateTime dateOfBirth;
//   String corporationName;
//   String corporationNumber;
//   String phoneNumber;

//   User({
//     required this.id,

//     required this.fullName,
//     required this.email,
//     required this.dateOfBirth,
//     required this.corporationName,
//     required this.corporationNumber,
//     required this.phoneNumber,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],

//         fullName: json["full_name"],
//         email: json["email"],
//         dateOfBirth: DateTime.parse(json["date_of_birth"]),
//         corporationName: json["corporation_name"],
//         corporationNumber: json["corporation_number"],
//         phoneNumber: json["phone_number"],
//       );
// }

// class Category {
//   int id;
//   String name;
//   String image;
//   DateTime created;
//   int popularity;

//   Category({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.created,
//     required this.popularity,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         image: json["image"],
//         created: DateTime.parse(json["created"]),
//         popularity: json["popularity"],
//       );
// }

// class RealtimePostObject {
//   int id;
//   DateTime created;
//   Question question;
//   PAnswer pAnswer;

//   RealtimePostObject({
//     required this.id,
//     required this.created,
//     required this.question,
//     required this.pAnswer,
//   });

//   factory RealtimePostObject.fromJson(Map<String, dynamic> json) =>
//       RealtimePostObject(
//         id: json["id"],
//         created: DateTime.parse(json["created"]),
//         question: Question.fromJson(json["question"]),
//         pAnswer: PAnswer.fromJson(json["p_answer"]),
//       );
// }

// class PAnswer {
//   int id;
//   String options;
//   int credit;
//   DateTime created;
//   int question;

//   PAnswer({
//     required this.id,
//     required this.options,
//     required this.credit,
//     required this.created,
//     required this.question,
//   });

//   factory PAnswer.fromJson(Map<String, dynamic> json) => PAnswer(
//         id: json["id"],
//         options: json["options"],
//         credit: json["credit"],
//         created: DateTime.parse(json["created"]),
//         question: json["question"],
//       );
// }

// class Question {
//   int id;
//   String qs;
//   int cat;

//   Question({
//     required this.id,
//     required this.qs,
//     required this.cat,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) => Question(
//         id: json["id"],
//         qs: json["qs"],
//         cat: json["cat"],
//       );
// }

// To parse this JSON data, do
//
//     final pendingBookNowModel = pendingBookNowModelFromJson(jsonString);

import 'dart:convert';

List<PendingBookNowModel> pendingBookNowModelFromJson(String str) =>
    List<PendingBookNowModel>.from(
        json.decode(str).map((x) => PendingBookNowModel.fromJson(x)));

class PendingBookNowModel {
  int id;
  BookedInUser user;
  BookedInUser bookedInUser;
  String location;
  String latitude;
  String longitude;
  Category category;
  List<RealtimePostObject> realtimePostObject;
  dynamic postCredit;
  bool postType;
  int responseCount;
  bool isResponse;
  String created;

  PendingBookNowModel({
    required this.id,
    required this.user,
    required this.bookedInUser,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.category,
    required this.realtimePostObject,
    this.postCredit,
    required this.postType,
    required this.responseCount,
    required this.isResponse,
    required this.created,
  });

  factory PendingBookNowModel.fromJson(Map<String, dynamic> json) =>
      PendingBookNowModel(
        id: json["id"],
        user: BookedInUser.fromJson(json["user"]),
        bookedInUser: BookedInUser.fromJson(json["booked_in_user"]),
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        category: Category.fromJson(json["category"]),
        realtimePostObject: List<RealtimePostObject>.from(
            json["realtime_post_object"]
                .map((x) => RealtimePostObject.fromJson(x))),
        postCredit: json["post_credit"],
        postType: json["post_type"],
        responseCount: json["response_count"],
        isResponse: json["is_response"],
        created: json["created"],
      );
}

class BookedInUser {
  int id;
  String fullName;
  String email;
  dynamic userProfilePic;
  DateTime dateOfBirth;
  String phoneNumber;
  String corporationName;
  String corporationNumber;

  BookedInUser({
    required this.id,
    required this.fullName,
    required this.email,
    this.userProfilePic,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.corporationName,
    required this.corporationNumber,
  });

  factory BookedInUser.fromJson(Map<String, dynamic> json) => BookedInUser(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        userProfilePic: json["user_profile_pic"]==null?null:UserProfilePic.fromJson(json["user_profile_pic"]),
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phoneNumber: json["phone_number"],
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
      );
}

class Category {
  int id;
  String name;
  String image;
  DateTime created;
  int popularity;
  Category? parent;

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
        name: json["name"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
        parent:
            json["parent"] == null ? null : Category.fromJson(json["parent"]),
      );
}

class RealtimePostObject {
  int id;
  DateTime created;
  Question question;
  PAnswer pAnswer;

  RealtimePostObject({
    required this.id,
    required this.created,
    required this.question,
    required this.pAnswer,
  });

  factory RealtimePostObject.fromJson(Map<String, dynamic> json) =>
      RealtimePostObject(
        id: json["id"],
        created: DateTime.parse(json["created"]),
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

class UserProfilePic {
    int id;
    int user;
    String picture;

    UserProfilePic({
        required this.id,
        required this.user,
        required this.picture,
    });

    factory UserProfilePic.fromJson(Map<String, dynamic> json) => UserProfilePic(
        id: json["id"],
        user: json["user"],
        picture: json["picture"],
    );

    
}
