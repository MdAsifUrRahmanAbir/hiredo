// To parse this JSON data, do
//
//     final userCreaditModel = userCreaditModelFromJson(jsonString);

import 'dart:convert';

List<UserCreaditModel> userCreaditModelFromJson(String str) =>
    List<UserCreaditModel>.from(
        json.decode(str).map((x) => UserCreaditModel.fromJson(x)));

String userCreaditModelToJson(List<UserCreaditModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCreaditModel {
  UserCreaditModel({
    required this.id,
    required this.creditAmount,
    required this.priceAmount,
    required this.created,
    required this.updated,
  });

  int id;
  int creditAmount;
  double priceAmount;
  DateTime created;
  DateTime updated;

  factory UserCreaditModel.fromJson(Map<String, dynamic> json) =>
      UserCreaditModel(
        id: json["id"],
        creditAmount: json["credit_amount"],
        priceAmount: json["price_amount"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "credit_amount": creditAmount,
        "price_amount": priceAmount,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
      };
}
