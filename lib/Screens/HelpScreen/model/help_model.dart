
// To parse this JSON data, do
//
//     final helpsModel = helpsModelFromJson(jsonString);

import 'dart:convert';

List<HelpsModel> helpsModelFromJson(String str) =>
    List<HelpsModel>.from(json.decode(str).map((x) => HelpsModel.fromJson(x)));

String helpsModelToJson(List<HelpsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HelpsModel {
  int id;
  String title;
  List<Help> helps;

  HelpsModel({
    required this.id,
    required this.title,
    required this.helps,
  });

  factory HelpsModel.fromJson(Map<String, dynamic> json) => HelpsModel(
        id: json["id"],
        title: json["title"],
        helps: List<Help>.from(json["helps"].map((x) => Help.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "helps": List<dynamic>.from(helps.map((x) => x.toJson())),
      };
}

class Help {
  int id;
  String question;
  String answer;

  Help({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory Help.fromJson(Map<String, dynamic> json) => Help(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}
