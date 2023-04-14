// To parse this JSON data, do
//
//     final smSTemplateModel = smSTemplateModelFromJson(jsonString);

import 'dart:convert';

List<SmSTemplateModel> smSTemplateModelFromJson(String str) => List<SmSTemplateModel>.from(json.decode(str).map((x) => SmSTemplateModel.fromJson(x)));

String smSTemplateModelToJson(List<SmSTemplateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SmSTemplateModel {
    SmSTemplateModel({
        required this.id,
        required this.user,
        required this.templateName,
        required this.message,
        required this.created,
        required this.updated,
    });

    int id;
    int user;
    String templateName;
    String message;
    DateTime created;
    DateTime updated;

    factory SmSTemplateModel.fromJson(Map<String, dynamic> json) => SmSTemplateModel(
        id: json["id"],
        user: json["user"],
        templateName: json["template_name"],
        message: json["message"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "template_name": templateName,
        "message": message,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
    };
}
