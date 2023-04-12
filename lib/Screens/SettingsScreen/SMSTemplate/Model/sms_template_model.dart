// To parse this JSON data, do
//
//     final smSTemplateModel = smSTemplateModelFromJson(jsonString);

import 'dart:convert';

List<SmSTemplateModel> smSTemplateModelFromJson(String str) => List<SmSTemplateModel>.from(json.decode(str).map((x) => SmSTemplateModel.fromJson(x)));


class SmSTemplateModel {
    SmSTemplateModel({
        required this.id,
        required this.templateName,
        required this.message,
        required this.created,
        required this.updated,
        required this.user,
    });

    int id;
    String templateName;
    String message;
    DateTime created;
    DateTime updated;
    int user;

    factory SmSTemplateModel.fromJson(Map<String, dynamic> json) => SmSTemplateModel(
        id: json["id"],
        templateName: json["template_name"],
        message: json["message"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        user: json["user"],
    );

}
