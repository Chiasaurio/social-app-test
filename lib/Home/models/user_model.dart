// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
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

  final int userId;
  final String name;
  final String instagram;
  final String company;
  final String city;
  final String phone;
  final String phrase;
  final int lastConnection;
  final String imageUrl;
  final String backgroundImageUrl;

  factory UserModel.fromJson(Map<String, dynamic> json, int id) => UserModel(
        userId: id,
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

  @override
  List<Object?> get props => [
        userId,
        name,
        instagram,
        company,
        city,
        phone,
        phrase,
        lastConnection,
        imageUrl,
        backgroundImageUrl
      ];
}
