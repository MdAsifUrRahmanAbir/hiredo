// To parse this JSON data, do
//
//     final addLocationModel = addLocationModelFromJson(jsonString);

import 'dart:convert';

List<AddLocationModel> addLocationModelFromJson(String str) =>
    List<AddLocationModel>.from(
        json.decode(str).map((x) => AddLocationModel.fromJson(x)));

class AddLocationModel {
  int id;
  String city;

  String distance;
  double latitude;
  double longitude;
  DateTime createdAt;
  DateTime updatedAt;

  AddLocationModel({
    required this.id,
    required this.city,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AddLocationModel.fromJson(Map<String, dynamic> json) =>
      AddLocationModel(
        id: json["id"],
        city: json["city"],
        distance: json["distance"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "distance": distance,
        "latitude": latitude,
        "longitude": longitude,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
