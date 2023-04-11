
import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));


class ServiceModel {
    ServiceModel({
        required this.id,
        required this.user,
        required this.serviceName,
        required this.serviceDescription,
    });

    int id;
    int user;
    int serviceName;
    String serviceDescription;

    factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        user: json["user"],
        serviceName: json["service_name"],
        serviceDescription: json["service_description"],
    );

   
}
