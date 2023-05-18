// To parse this JSON data, do
//
//     final onClickResponseModel = onClickResponseModelFromJson(jsonString);

import 'dart:convert';

List<OnClickResponseModel> onClickResponseModelFromJson(String str) =>
    List<OnClickResponseModel>.from(
        json.decode(str).map((x) => OnClickResponseModel.fromJson(x)));
OnClickResponseModel onClickResponseModelFromMap(String str) => OnClickResponseModel.fromJson(json.decode(str));


String onClickResponseModelToJson(List<OnClickResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OnClickResponseModel {
  int id;
  String user;
  bool oneClickResponse;
  dynamic template;

  OnClickResponseModel({
    required this.id,
    required this.user,
    required this.oneClickResponse,
    required this.template,
  });

  factory OnClickResponseModel.fromJson(Map<String, dynamic> json) =>
      OnClickResponseModel(
        id: json["id"],
        user: json["user"],
        oneClickResponse: json["one_click_response"],
        template:json["template"]==null?null:Template.fromJson(json["template"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "one_click_response": oneClickResponse,
        "template": template.toJson(),
      };
}

class Template {
  int id;
  String templateName;
  String message;
  DateTime createdAt;
  DateTime updatedAt;
  int user;

  Template({
    required this.id,
    required this.templateName,
    required this.message,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json["id"],
        templateName: json["template_name"],
        message: json["message"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "template_name": templateName,
        "message": message,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user,
      };
}
