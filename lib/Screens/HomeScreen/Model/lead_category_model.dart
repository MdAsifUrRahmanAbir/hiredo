// To parse this JSON data, do
//
//     final leadCategoryModel = leadCategoryModelFromMap(jsonString);

import 'dart:convert';

LeadCategoryModel leadCategoryModelFromMap(String str) =>
    LeadCategoryModel.fromMap(json.decode(str));

String leadCategoryModelToMap(LeadCategoryModel data) =>
    json.encode(data.toMap());

class LeadCategoryModel {
  LeadCategoryModel({
    this.next,
    this.previous,
    this.results,
  });

  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory LeadCategoryModel.fromMap(Map<String, dynamic> json) =>
      LeadCategoryModel(
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.catName,
    this.children,
  });

  int? id;
  String? name;
  List<CatName>? catName;
  List<dynamic>? children;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        catName: json["cat_name"] == null
            ? []
            : List<CatName>.from(
                json["cat_name"]!.map((x) => CatName.fromMap(x))),
        children: json["children"] == null
            ? []
            : List<dynamic>.from(json["children"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "cat_name": catName == null
            ? []
            : List<dynamic>.from(catName!.map((x) => x.toMap())),
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}

class CatName {
  CatName({
    this.qs,
    this.answers,
    this.cat,
  });

  String? qs;
  List<Answer>? answers;
  Cat? cat;

  factory CatName.fromMap(Map<String, dynamic> json) => CatName(
        qs: json["qs"],
        answers: json["answers"] == null
            ? []
            : List<Answer>.from(json["answers"]!.map((x) => Answer.fromMap(x))),
        cat: json["cat"] == null ? null : Cat.fromMap(json["cat"]),
      );

  Map<String, dynamic> toMap() => {
        "qs": qs,
        "answers": answers == null
            ? []
            : List<dynamic>.from(answers!.map((x) => x.toMap())),
        "cat": cat?.toMap(),
      };
}

class Answer {
  Answer({
    this.question,
    this.options,
  });

  Question? question;
  String? options;

  factory Answer.fromMap(Map<String, dynamic> json) => Answer(
        question: json["question"] == null
            ? null
            : Question.fromMap(json["question"]),
        options: json["options"],
      );

  Map<String, dynamic> toMap() => {
        "question": question?.toMap(),
        "options": options,
      };
}

class Question {
  Question({
    this.qs,
  });

  String? qs;

  factory Question.fromMap(Map<String, dynamic> json) => Question(
        qs: json["qs"],
      );

  Map<String, dynamic> toMap() => {
        "qs": qs,
      };
}

class Cat {
  Cat({
    this.id,
    this.name,
    this.created,
    this.parent,
  });

  int? id;
  String? name;
  DateTime? created;
  dynamic parent;

  factory Cat.fromMap(Map<String, dynamic> json) => Cat(
        id: json["id"],
        name: json["name"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        parent: json["parent"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "created": created?.toIso8601String(),
        "parent": parent,
      };
}
