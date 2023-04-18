// To parse this JSON data, do
//
//     final serviceWishList = serviceWishListFromJson(jsonString);

import 'dart:convert';

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
  CategoryService categoryService;

  factory ServiceWishList.fromJson(Map<String, dynamic> json) =>
      ServiceWishList(
        id: json["id"],
        user: json["user"],
        categoryService: CategoryService.fromJson(json["category_service"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "category_service": categoryService.toJson(),
      };
}

class CategoryService {
  CategoryService({
    required this.id,
    required this.name,
    required this.image,
    required this.catName,
    required this.children,
    required this.popularity,
  });

  int id;
  String name;
  String image;
  List<dynamic> catName;
  List<CategoryService> children;
  int popularity;

  factory CategoryService.fromJson(Map<String, dynamic> json) =>
      CategoryService(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        catName: List<dynamic>.from(json["cat_name"].map((x) => x)),
        children: List<CategoryService>.from(
            json["children"].map((x) => CategoryService.fromJson(x))),
        popularity: json["popularity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "cat_name": List<dynamic>.from(catName.map((x) => x)),
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
        "popularity": popularity,
      };
}
