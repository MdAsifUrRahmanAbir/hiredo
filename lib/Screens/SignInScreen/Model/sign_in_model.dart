// To parse this JSON data, do
//
//     final signInModel = signInModelFromMap(jsonString);

import 'dart:convert';

SignInModel signInModelFromMap(String str) =>
    SignInModel.fromMap(json.decode(str));

String signInModelToMap(SignInModel data) => json.encode(data.toMap());

class SignInModel {
  SignInModel({
    this.token,
    this.message,
  });

  String? token;
  String? message;

  factory SignInModel.fromMap(Map<String, dynamic> json) => SignInModel(
        token: json["token"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "message": message,
      };
}
