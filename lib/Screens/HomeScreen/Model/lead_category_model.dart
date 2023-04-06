// To parse this JSON data, do
//
//     final leadCategoriesModel = leadCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<LeadCategoriesModel> leadCategoriesModelFromJson(String str) => List<LeadCategoriesModel>.from(json.decode(str).map((x) => LeadCategoriesModel.fromJson(x)));

String leadCategoriesModelToJson(List<LeadCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeadCategoriesModel {
    LeadCategoriesModel({
        required this.id,
        required this.name,
        this.image,
        required this.catName,
        required this.children,
    });

    int id;
    String name;
    String? image;
    List<CatName> catName;
    List<LeadCategoriesModel> children;

    factory LeadCategoriesModel.fromJson(Map<String, dynamic> json) => LeadCategoriesModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        catName: List<CatName>.from(json["cat_name"].map((x) => CatName.fromJson(x))),
        children: List<LeadCategoriesModel>.from(json["children"].map((x) => LeadCategoriesModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "cat_name": List<dynamic>.from(catName.map((x) => x.toJson())),
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
    };
}

class CatName {
    CatName({
        required this.id,
        required this.qs,
        required this.answers,
        required this.cat,
    });

    int id;
    String qs;
    List<Answer> answers;
    Cat cat;

    factory CatName.fromJson(Map<String, dynamic> json) => CatName(
        id: json["id"],
        qs: json["qs"],
        answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        cat: Cat.fromJson(json["cat"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "qs": qs,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "cat": cat.toJson(),
    };
}

class Answer {
    Answer({
        required this.id,
        required this.question,
        required this.options,
        required this.credit,
    });

    int id;
    Question question;
    String options;
    int credit;

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
    Question({
        required this.qs,
    });

    String qs;

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        qs: json["qs"],
    );

    Map<String, dynamic> toJson() => {
        "qs": qs,
    };
}

class Cat {
    Cat({
        required this.id,
        required this.name,
        required this.image,
        required this.created,
        this.parent,
    });

    int id;
    String name;
    String image;
    DateTime created;
    int? parent;

    factory Cat.fromJson(Map<String, dynamic> json) => Cat(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
        parent: json["parent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created": created.toIso8601String(),
        "parent": parent,
    };
}
