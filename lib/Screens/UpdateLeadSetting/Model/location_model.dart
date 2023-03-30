// To parse this JSON data, do
//
//     final locationModel = locationModelFromMap(jsonString);

import 'dart:convert';

LocationModel locationModelFromMap(String str) =>
    LocationModel.fromMap(json.decode(str));

String locationModelToMap(LocationModel data) => json.encode(data.toMap());

class LocationModel {
  LocationModel({
    this.next,
    this.previous,
    this.results,
  });

  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
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
    this.user,
    this.city,
    this.distance,
    this.created,
    this.updated,
  });

  int? id;
  int? user;
  String? city;
  String? distance;
  DateTime? created;
  DateTime? updated;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        user: json["user"],
        city: json["city"],
        distance: json["distance"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user,
        "city": city,
        "distance": distance,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
      };
}
