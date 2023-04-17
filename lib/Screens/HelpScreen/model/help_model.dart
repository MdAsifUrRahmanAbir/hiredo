// To parse this JSON data, do
//
//     final helpModel = helpModelFromJson(jsonString);

import 'dart:convert';

List<HelpModel> helpModelFromJson(String str) =>
    List<HelpModel>.from(json.decode(str).map((x) => HelpModel.fromJson(x)));

String helpModelToJson(List<HelpModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HelpModel {
  HelpModel({
    required this.id,
    required this.topic,
    required this.question,
    required this.answer,
  });

  int id;
  Topic topic;
  String question;
  String answer;

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
        id: json["id"],
        topic: Topic.fromJson(json["topic"]),
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic": topic.toJson(),
        "question": question,
        "answer": answer,
      };
}

class Topic {
  Topic({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
