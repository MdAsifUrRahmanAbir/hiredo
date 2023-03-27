// To parse this JSON data, do
//
//     final signInErrorModel = signInErrorModelFromMap(jsonString);

import 'dart:convert';

SignInErrorModel signInErrorModelFromMap(String str) =>
    SignInErrorModel.fromMap(json.decode(str));

String signInErrorModelToMap(SignInErrorModel data) =>
    json.encode(data.toMap());

class SignInErrorModel {
  SignInErrorModel({
    this.errors,
  });

  Errors? errors;

  factory SignInErrorModel.fromMap(Map<String, dynamic> json) =>
      SignInErrorModel(
        errors: json["errors"] == null ? null : Errors.fromMap(json["errors"]),
      );

  Map<String, dynamic> toMap() => {
        "errors": errors?.toMap(),
      };
}

class Errors {
  Errors({
    this.nonFieldErrors,
  });

  List<String>? nonFieldErrors;

  factory Errors.fromMap(Map<String, dynamic> json) => Errors(
        nonFieldErrors: json["non_field_errors"] == null
            ? []
            : List<String>.from(json["non_field_errors"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "non_field_errors": nonFieldErrors == null
            ? []
            : List<dynamic>.from(nonFieldErrors!.map((x) => x)),
      };
}
