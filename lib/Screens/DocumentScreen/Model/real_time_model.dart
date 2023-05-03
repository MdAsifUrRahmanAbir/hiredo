// To parse this JSON data, do
//
//     final realTimeServiceModel = realTimeServiceModelFromJson(jsonString);

import 'dart:convert';

List<RealTimeServiceModel> realTimeServiceModelFromJson(String str) =>
    List<RealTimeServiceModel>.from(
        json.decode(str).map((x) => RealTimeServiceModel.fromJson(x)));

String realTimeServiceModelToJson(List<RealTimeServiceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RealTimeServiceModel {
  int id;
  User? user;
  ServiceName serviceName;
  String serviceDescription;
  double? total;

  RealTimeServiceModel({
    required this.id,
    this.user,
    required this.serviceName,
    required this.serviceDescription,
    this.total,
  });

  factory RealTimeServiceModel.fromJson(Map<String, dynamic> json) =>
      RealTimeServiceModel(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        serviceName: ServiceName.fromJson(json["service_name"]),
        serviceDescription: json["service_description"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "service_name": serviceName.toJson(),
        "service_description": serviceDescription,
        "total": total,
      };
}

class ServiceName {
  int id;
  String name;
  String image;
  List<CatName> catName;
  List<ServiceName> children;
  int popularity;

  ServiceName({
    required this.id,
    required this.name,
    required this.image,
    required this.catName,
    required this.children,
    required this.popularity,
  });

  factory ServiceName.fromJson(Map<String, dynamic> json) => ServiceName(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        catName: List<CatName>.from(
            json["cat_name"].map((x) => CatName.fromJson(x))),
        children: List<ServiceName>.from(
            json["children"].map((x) => ServiceName.fromJson(x))),
        popularity: json["popularity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "cat_name": List<dynamic>.from(catName.map((x) => x.toJson())),
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "popularity": popularity,
      };
}

class CatName {
  int id;
  Qs qs;
  List<Answer> answers;
  Cat cat;

  CatName({
    required this.id,
    required this.qs,
    required this.answers,
    required this.cat,
  });

  factory CatName.fromJson(Map<String, dynamic> json) => CatName(
        id: json["id"],
        qs: qsValues.map[json["qs"]]!,
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        cat: Cat.fromJson(json["cat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qs": qsValues.reverse[qs],
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "cat": cat.toJson(),
      };
}

class Answer {
  int id;
  Question question;
  String options;
  int credit;

  Answer({
    required this.id,
    required this.question,
    required this.options,
    required this.credit,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        question: Question.fromJson(json["question"]),
        options: json["options"],
        credit: json["credit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question.toJson(),
        "options": options,
        "credit": credit,
      };
}

class Question {
  Qs qs;

  Question({
    required this.qs,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        qs: qsValues.map[json["qs"]]!,
      );

  Map<String, dynamic> toJson() => {
        "qs": qsValues.reverse[qs],
      };
}

enum Qs {
  HOW_MANY_ROOMS_CLEAN,
  WHAT_IS_PLUMBING_NUMBER,
  HOW_MANY_ROOM_ARE_YOU_WANT_TO_CLEAN
}

final qsValues = EnumValues({
  "How many rooms clean?": Qs.HOW_MANY_ROOMS_CLEAN,
  "How many room are you want to clean?":
      Qs.HOW_MANY_ROOM_ARE_YOU_WANT_TO_CLEAN,
  "What is plumbing number": Qs.WHAT_IS_PLUMBING_NUMBER
});

class Cat {
  int id;
  Name name;
  String image;
  DateTime created;
  int popularity;
  int? parent;

  Cat({
    required this.id,
    required this.name,
    required this.image,
    required this.created,
    required this.popularity,
    this.parent,
  });

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "created": created.toIso8601String(),
        "popularity": popularity,
        "parent": parent,
      };
}

enum Name { GENERAL_PLUMBING, HOUSE_CLEAN }

final nameValues = EnumValues({
  "General Plumbing": Name.GENERAL_PLUMBING,
  "House Clean": Name.HOUSE_CLEAN
});

class ReviewsReceived {
  int id;
  User reviewedBy;
  int reviewedUser;
  double rating;
  String comment;
  DateTime created;

  ReviewsReceived({
    required this.id,
    required this.reviewedBy,
    required this.reviewedUser,
    required this.rating,
    required this.comment,
    required this.created,
  });

  factory ReviewsReceived.fromJson(Map<String, dynamic> json) =>
      ReviewsReceived(
        id: json["id"],
        reviewedBy: User.fromJson(json["reviewed_by"]),
        reviewedUser: json["reviewed_user"],
        rating: json["rating"],
        comment: json["comment"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reviewed_by": reviewedBy.toJson(),
        "reviewed_user": reviewedUser,
        "rating": rating,
        "comment": comment,
        "created": created.toIso8601String(),
      };
}

class User {
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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "picture": picture,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
