// To parse this JSON data, do
//
//     final addServicesModel = addServicesModelFromMap(jsonString);

import 'dart:convert';

AddServicesModel addServicesModelFromMap(String str) =>
    AddServicesModel.fromMap(json.decode(str));

String addServicesModelToMap(AddServicesModel data) =>
    json.encode(data.toMap());

class AddServicesModel {
  AddServicesModel({
    this.next,
    this.previous,
    this.results,
  });

  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory AddServicesModel.fromMap(Map<String, dynamic> json) =>
      AddServicesModel(
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
    this.serviceName,
    this.serviceDescription,
  });

  int? id;
  int? user;
  String? serviceName;
  String? serviceDescription;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        user: json["user"],
        serviceName: json["service_name"],
        serviceDescription: json["service_description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user,
        "service_name": serviceName,
        "service_description": serviceDescription,
      };
}
