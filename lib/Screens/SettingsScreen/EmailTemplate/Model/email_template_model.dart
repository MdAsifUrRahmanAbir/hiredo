// To parse this JSON data, do
//
//     final emailTemplateModel = emailTemplateModelFromJson(jsonString);

import 'dart:convert';

List<EmailTemplateModel> emailTemplateModelFromJson(String str) => List<EmailTemplateModel>.from(json.decode(str).map((x) => EmailTemplateModel.fromJson(x)));

String emailTemplateModelToJson(List<EmailTemplateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmailTemplateModel {
    EmailTemplateModel({
        required this.user,
        required this.templateName,
        required this.message,
    });

    int user;
    String templateName;
    String message;

    factory EmailTemplateModel.fromJson(Map<String, dynamic> json) => EmailTemplateModel(
        user: json["user"],
        templateName: json["template_name"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "template_name": templateName,
        "message": message,
    };
}
