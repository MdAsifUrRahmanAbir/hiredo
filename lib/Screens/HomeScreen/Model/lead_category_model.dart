// To parse this JSON data, do
//
//     final leadCategoriesModel = leadCategoriesModelFromMap(jsonString);

import 'dart:convert';

LeadCategoriesModel leadCategoriesModelFromMap(String str) =>
    LeadCategoriesModel.fromMap(json.decode(str));

String leadCategoriesModelToMap(LeadCategoriesModel data) =>
    json.encode(data.toMap());

class LeadCategoriesModel {
  LeadCategoriesModel({
    this.next,
    this.previous,
    this.results,
  });

  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory LeadCategoriesModel.fromMap(Map<String, dynamic> json) =>
      LeadCategoriesModel(
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
    this.image,
    this.catName,
    this.children,
  });

  int? id;
  String? name;
  dynamic image;
  List<dynamic>? catName;
  List<dynamic>? children;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        catName: json["cat_name"] == null
            ? []
            : List<dynamic>.from(json["cat_name"]!.map((x) => x)),
        children: json["children"] == null
            ? []
            : List<dynamic>.from(json["children"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "cat_name":
            catName == null ? [] : List<dynamic>.from(catName!.map((x) => x)),
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}
