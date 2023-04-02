// To parse this JSON data, do
//
//     final leadCategoriesModel = leadCategoriesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<LeadCategoriesModel> leadCategoriesModelFromJson(String str) => List<LeadCategoriesModel>.from(json.decode(str).map((x) => LeadCategoriesModel.fromJson(x)));

String leadCategoriesModelToJson(List<LeadCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeadCategoriesModel {
    LeadCategoriesModel({
        required this.id,
        required this.name,
        required this.image,
        required this.catName,
        required this.children,
    });

    int id;
    String name;
    String image;
    List<dynamic> catName;
    List<LeadCategoriesModel> children;

    factory LeadCategoriesModel.fromJson(Map<String, dynamic> json) => LeadCategoriesModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        catName: List<dynamic>.from(json["cat_name"].map((x) => x)),
        children: List<LeadCategoriesModel>.from(json["children"].map((x) => LeadCategoriesModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "cat_name": List<dynamic>.from(catName.map((x) => x)),
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
    };
}
