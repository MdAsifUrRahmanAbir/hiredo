// To parse this JSON data, do
//
//     final companyWishListModel = companyWishListModelFromJson(jsonString);

import 'dart:convert';

List<CompanyWishListModel> companyWishListModelFromJson(String str) => List<CompanyWishListModel>.from(json.decode(str).map((x) => CompanyWishListModel.fromJson(x)));


class CompanyWishListModel {
    int id;

    WishedUser wishedUser;
    double productRatingAvg;

    CompanyWishListModel({
        required this.id,
     
        required this.wishedUser,
        required this.productRatingAvg,
    });

    factory CompanyWishListModel.fromJson(Map<String, dynamic> json) => CompanyWishListModel(
        id: json["id"],
     
        wishedUser: WishedUser.fromJson(json["wished_user"]),
        productRatingAvg: json["product_rating_avg"] ?? 0.0,
    );

   
}


class WishedUser {
    int id;
    String fullName;
    dynamic userProfilePic;
    String email;
    DateTime dateOfBirth;
    String phoneNumber;
    String corporationName;
    String corporationNumber;
   

    WishedUser({
        required this.id,
        required this.fullName,
        required this.userProfilePic,
        required this.email,
        required this.dateOfBirth,
        required this.phoneNumber,
        required this.corporationName,
        required this.corporationNumber,
       
    });

    factory WishedUser.fromJson(Map<String, dynamic> json) => WishedUser(
        id: json["id"],
        fullName: json["full_name"],
        userProfilePic:json["user_profile_pic"]==null?null:UserProfilePic.fromJson(json["user_profile_pic"]),
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phoneNumber: json["phone_number"],
        corporationName: json["corporation_name"],
        corporationNumber: json["corporation_number"],
       
    );

   
}

class UserProfilePic {
    int id;
    int user;
    String picture;

    UserProfilePic({
        required this.id,
        required this.user,
        required this.picture,
    });

    factory UserProfilePic.fromJson(Map<String, dynamic> json) => UserProfilePic(
        id: json["id"],
        user: json["user"],
        picture: json["picture"],
    );

   
}
