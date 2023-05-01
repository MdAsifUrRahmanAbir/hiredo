// To parse this JSON data, do
//
//     final serviceWishList = serviceWishListFromJson(jsonString);

import 'dart:convert';

import 'package:homelyknock/Screens/HomeScreen/Model/lead_category_model.dart';

List<ServiceWishList> serviceWishListFromJson(String str) =>
    List<ServiceWishList>.from(
        json.decode(str).map((x) => ServiceWishList.fromJson(x)));

String serviceWishListToJson(List<ServiceWishList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceWishList {
  ServiceWishList({
    required this.id,
    required this.user,
    required this.categoryService,
  });

  int id;
  int user;
  LeadCategoriesModel categoryService;

  factory ServiceWishList.fromJson(Map<String, dynamic> json) =>
      ServiceWishList(
        id: json["id"],
        user: json["user"],
        categoryService: LeadCategoriesModel.fromJson(json["category_service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "category_service": categoryService.toJson(),
      };
}


