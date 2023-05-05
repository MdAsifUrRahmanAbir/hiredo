// To parse this JSON data, do
//
//     final pendingBookNowModel = pendingBookNowModelFromJson(jsonString);

import 'dart:convert';

List<PendingBookNowModel> pendingBookNowModelFromJson(String str) =>
    List<PendingBookNowModel>.from(
        json.decode(str).map((x) => PendingBookNowModel.fromJson(x)));

class PendingBookNowModel {
  int id;
  String location;
  String latitude;
  String longitude;
  String created;
  User user;
  User bookedInUser;
  Category category;
  List<RealtimePostObject> realtimePostObject;

  PendingBookNowModel({
    required this.id,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.created,
    required this.user,
    required this.bookedInUser,
    required this.category,
    required this.realtimePostObject,
  });

  factory PendingBookNowModel.fromJson(Map<String, dynamic> json) =>
      PendingBookNowModel(
        id: json["id"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        created: json["created"],
        user: User.fromJson(json["user"]),
        bookedInUser: User.fromJson(json["booked_in_user"]),
        category: Category.fromJson(json["category"]),
        realtimePostObject: List<RealtimePostObject>.from(
            json["realtime_post_object"]
                .map((x) => RealtimePostObject.fromJson(x))),
      );
}

class User {
  int id;
  bool isSuperuser;
  String fullName;
  String email;
  DateTime dateOfBirth;
  String corporationName;
  String corporationNumber;
  String phoneNumber;

  User({
    required this.id,
    required this.isSuperuser,
    required this.fullName,
    required this.email,
    required this.dateOfBirth,
    required this.corporationName,
    required this.corporationNumber,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        isSuperuser: json["is_superuser"],
        fullName: json["full_name"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
        phoneNumber: json["phone_number"],
      );
}

class Category {
  int id;
  String name;
  String image;
  DateTime created;
  int popularity;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.created,
    required this.popularity,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
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
