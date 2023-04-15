// To parse this JSON data, do
//
//     final jobPostModel = jobPostModelFromJson(jsonString);

import 'dart:convert';

List<JobPostModel> jobPostModelFromJson(String str) => List<JobPostModel>.from(json.decode(str).map((x) => JobPostModel.fromJson(x)));

String jobPostModelToJson(List<JobPostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobPostModel {
    JobPostModel({
        required this.category,
        required this.question,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.pAnswer,
    });

    int category;
    int question;
    String location;
    String latitude;
    String longitude;
    int pAnswer;

    factory JobPostModel.fromJson(Map<String, dynamic> json) => JobPostModel(
        category: json["category"],
        question: json["question"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        pAnswer: json["p_answer"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "question": question,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "p_answer": pAnswer,
    };
}
