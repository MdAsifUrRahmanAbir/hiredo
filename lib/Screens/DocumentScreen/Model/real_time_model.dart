// To parse this JSON data, do
//
//     final realTimeServiceModel = realTimeServiceModelFromJson(jsonString);

import 'dart:convert';

import '../../HomeScreen/Model/lead_category_model.dart';

List<RealTimeServiceModel> realTimeServiceModelFromJson(String str) =>
    List<RealTimeServiceModel>.from(
        json.decode(str).map((x) => RealTimeServiceModel.fromJson(x)));

class RealTimeServiceModel {
  int id;
  User? user;
  LeadCategoriesModel serviceName;

  double? total;

  RealTimeServiceModel({
    required this.id,
    this.user,
    required this.serviceName,
    this.total,
  });

  factory RealTimeServiceModel.fromJson(Map<String, dynamic> json) =>
      RealTimeServiceModel(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        serviceName: LeadCategoriesModel.fromJson(json["service_name"]),
        total: json["total"]?.toDouble(),
      );
}

class User {
  int id;
  String fullName;
  String email;
  String corporationName;
  String corporationNumber;
 

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.corporationName,
    required this.corporationNumber,
    
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
       
      );
}

