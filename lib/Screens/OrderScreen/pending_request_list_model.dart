// To parse this JSON data, do
//
//     final pendingRequestListModel = pendingRequestListModelFromJson(jsonString);

import 'dart:convert';

List<PendingRequestListModel> pendingRequestListModelFromJson(String str) => List<PendingRequestListModel>.from(json.decode(str).map((x) => PendingRequestListModel.fromJson(x)));

String pendingRequestListModelToJson(List<PendingRequestListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingRequestListModel {
    PendingRequestListModel({
        required this.id,
        required this.post,
        required this.profileName,
        required this.profile,
        required this.rating,
        required this.requestAccepted,
    });

    int id;
    int post;
    String profileName;
    int profile;
    double rating;
    bool requestAccepted;

    factory PendingRequestListModel.fromJson(Map<String, dynamic> json) => PendingRequestListModel(
        id: json["id"],
        post: json["post"],
        profileName: json["profile_name"],
        profile: json["profile"],
        rating: json["rating"],
        requestAccepted: json["request_accepted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "post": post,
        "profile_name": profileName,
        "profile": profile,
        "rating": rating,
        "request_accepted": requestAccepted,
    };
}
