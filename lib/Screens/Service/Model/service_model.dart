// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(
    json.decode(str).map((x) => ServiceModel.fromJson(x)));


class ServiceModel {
  ServiceModel({
    required this.id,
    required this.serviceName,
    required this.serviceDescription,
  });

  int id;

  ServiceName serviceName;
  String serviceDescription;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        serviceName: ServiceName.fromJson(json["service_name"]),
        serviceDescription: json["service_description"],
      );

}

class ServiceName {
  ServiceName({
    required this.id,
    required this.name,
    required this.image,
    required this.created,
    required this.popularity,
  });

  int id;
  String name;
  String image;
  DateTime created;
  int popularity;

  factory ServiceName.fromJson(Map<String, dynamic> json) => ServiceName(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        created: DateTime.parse(json["created"]),
        popularity: json["popularity"],
      );


}
