import 'dart:convert';

List<GetLocationModel> getLocationModelFromJson(String str) => List<GetLocationModel>.from(json.decode(str).map((x) => GetLocationModel.fromJson(x)));

String getLocationModelToJson(List<GetLocationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetLocationModel {
  GetLocationModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory GetLocationModel.fromJson(Map<String, dynamic> json) => GetLocationModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
