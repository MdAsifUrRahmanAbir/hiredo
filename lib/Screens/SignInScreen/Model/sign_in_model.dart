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

  Token? token;
  String? message;

  factory SignInModel.fromMap(Map<String, dynamic> json) => SignInModel(
        token: json["token"] == null ? null : Token.fromMap(json["token"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "token": token?.toMap(),
        "message": message,
      };
}

class Token {
  Token({
    this.refresh,
    this.access,
  });

  String? refresh;
  String? access;

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toMap() => {
        "refresh": refresh,
        "access": access,
      };
}
