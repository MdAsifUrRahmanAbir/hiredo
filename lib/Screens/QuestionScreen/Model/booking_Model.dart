
import 'dart:convert';

List<BookNowModel> bookNowModelFromJson(String str) => List<BookNowModel>.from(json.decode(str).map((x) => BookNowModel.fromJson(x)));

String bookNowModelToJson(List<BookNowModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookNowModel {
    int bookedInUser;
    int category;
    int question;
    String location;
    String latitude;
    String longitude;
    int pAnswer;

    BookNowModel({
        required this.bookedInUser,
        required this.category,
        required this.question,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.pAnswer,
    });

    factory BookNowModel.fromJson(Map<String, dynamic> json) => BookNowModel(
        bookedInUser: json["booked_in_user"],
        category: json["category"],
        question: json["question"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        pAnswer: json["p_answer"],
    );

    Map<String, dynamic> toJson() => {
        "booked_in_user": bookedInUser,
        "category": category,
        "question": question,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "p_answer": pAnswer,
    };
}
