// To parse this JSON data, do
//
//     final bedgeModel = bedgeModelFromJson(jsonString);

import 'dart:convert';

List<BedgeModel> bedgeModelFromJson(String str) => List<BedgeModel>.from(json.decode(str).map((x) => BedgeModel.fromJson(x)));

String bedgeModelToJson(List<BedgeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BedgeModel {
    BedgeModel({
        required this.id,
        required this.user,
        required this.title,
        required this.description,
        required this.image,
        required this.longDescription,
    });

    int id;
    int user;
    String title;
    String description;
    String image;
    String longDescription;

    factory BedgeModel.fromJson(Map<String, dynamic> json) => BedgeModel(
        id: json["id"],
        user: json["user"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        longDescription: json["long_description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "title": title,
        "description": description,
        "image": image,
        "long_description": longDescription,
    };
}
