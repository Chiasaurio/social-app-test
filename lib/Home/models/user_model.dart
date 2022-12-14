// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.name,
    required this.instagram,
    required this.company,
    required this.city,
    required this.phone,
    required this.phrase,
    required this.lastConnection,
    required this.imageUrl,
    required this.backgroundImageUrl,
  });

  int userId;
  String name;
  String instagram;
  String company;
  String city;
  String phone;
  String phrase;
  int lastConnection;
  String imageUrl;
  String backgroundImageUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        name: json["name"],
        instagram: json["instagram"],
        company: json["company"],
        city: json["city"],
        phone: json["phone"],
        phrase: json["phrase"],
        lastConnection: json["last_connection"],
        imageUrl: json["image_url"],
        backgroundImageUrl: json["background_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "instagram": instagram,
        "company": company,
        "city": city,
        "phone": phone,
        "phrase": phrase,
        "last_connection": lastConnection,
        "image_url": imageUrl,
        "background_image_url": backgroundImageUrl
      };
}
