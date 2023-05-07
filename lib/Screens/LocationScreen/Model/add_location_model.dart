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
  List<Service> service;

  AddLocationModel({
    required this.id,
    required this.city,
    required this.distance,
    required this.latitude,
    required this.longitude,
    required this.service,
  });

  factory AddLocationModel.fromJson(Map<String, dynamic> json) =>
      AddLocationModel(
        id: json["id"],
        city: json["city"],
        distance: json["distance"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        service:
            List<Service>.from(json["service"].map((x) => Service.fromJson(x))),
      );
}

class Service {
  int id;

  Service({
    required this.id,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
      );
}
