// To parse this JSON data, do
//
//     final locationDataModel = locationDataModelFromJson(jsonString);

import 'dart:convert';

List<LocationDataModel> locationDataModelFromJson(String str) => List<LocationDataModel>.from(json.decode(str).map((x) => LocationDataModel.fromJson(x)));

String locationDataModelToJson(List<LocationDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationDataModel {
    LocationDataModel({
        required this.location,
        required this.latitude,
        required this.longitude,
    });

    String location;
    String latitude;
    String longitude;

    factory LocationDataModel.fromJson(Map<String, dynamic> json) => LocationDataModel(
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
    };
}
