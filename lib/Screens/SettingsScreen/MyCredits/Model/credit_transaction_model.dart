// To parse this JSON data, do
//
//     final creditTransactionModel = creditTransactionModelFromJson(jsonString);

import 'dart:convert';

List<CreditTransactionModel> creditTransactionModelFromJson(String str) =>
    List<CreditTransactionModel>.from(
        json.decode(str).map((x) => CreditTransactionModel.fromJson(x)));

String creditTransactionModelToJson(List<CreditTransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreditTransactionModel {
  int id;
  String userId;
  String userName;
  String leadPostId;
  double leadPostCredit;
  DateTime date;

  CreditTransactionModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.leadPostId,
    required this.leadPostCredit,
    required this.date,
  });

  factory CreditTransactionModel.fromJson(Map<String, dynamic> json) =>
      CreditTransactionModel(
        id: json["id"],
        userId: json["user_id"],
        userName: json["user_name"],
        leadPostId: json["lead_post_id"],
        leadPostCredit: json["lead_post_credit"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "user_name": userName,
        "lead_post_id": leadPostId,
        "lead_post_credit": leadPostCredit,
        "date": date.toIso8601String(),
      };
}
