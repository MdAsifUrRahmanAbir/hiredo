// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';



String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        required this.fullName,
        required this.email,
        required this.dateOfBirth,
        required this.phoneNumber,
        required this.corporationName,
        required this.corporationNumber,
        required this.isUser,
        required this.isProfessional,
        required this.password,
        required this.stripeCustomerId,
    });

    String fullName;
    String email;
    String dateOfBirth;
    String phoneNumber;
    String corporationName;
    String corporationNumber;
    bool isUser;
    bool isProfessional;
    String password;
    String stripeCustomerId;

    

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "date_of_birth": dateOfBirth,
        "phone_number": phoneNumber,
        "corporation_name": corporationName,
        "corporation_number": corporationNumber,
        "is_user": isUser,
        "is_professional": isProfessional,
        "password": password,
        "stripe_customerId":stripeCustomerId,
    };
}
