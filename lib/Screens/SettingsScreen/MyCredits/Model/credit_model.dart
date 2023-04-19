// To parse this JSON data, do
//
//     final creaditModel = creaditModelFromJson(jsonString);

import 'dart:convert';

CreaditModel creaditModelFromJson(String str) =>
    CreaditModel.fromJson(json.decode(str));

String creaditModelToJson(CreaditModel data) => json.encode(data.toJson());

class CreaditModel {
  CreaditModel({
    required this.totalCredit,
  });

  int totalCredit;

  factory CreaditModel.fromJson(Map<String, dynamic> json) => CreaditModel(
        totalCredit: json["total_credit"],
      );

  Map<String, dynamic> toJson() => {
        "total_credit": totalCredit,
      };
}
