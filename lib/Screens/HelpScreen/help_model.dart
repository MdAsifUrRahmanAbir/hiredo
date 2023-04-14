// To parse this JSON data, do
//
//     final helpModel = helpModelFromJson(jsonString);

import 'dart:convert';

HelpModel helpModelFromJson(String str) => HelpModel.fromJson(json.decode(str));

String helpModelToJson(HelpModel data) => json.encode(data.toJson());

class HelpModel {
  HelpModel({
    required this.message,
  });

  String message;

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
