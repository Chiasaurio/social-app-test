// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

import 'package:prueba/Home/models/user_model.dart';

PostModel commentFromJson(String str) => PostModel.fromJson(json.decode(str));

String commentToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.userId,
    required this.content,
    required this.likes,
    required this.comments,
    this.firebaseId,
    required this.shares,
    required this.likeMe,
  });

  int userId;
  String content;
  String? firebaseId;
  int likes;
  int comments;
  int shares;
  bool likeMe;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["user_id"],
        firebaseId: json["firebase_id"],
        content: json["content"],
        likes: json["likes"],
        comments: json["comments"],
        shares: json["shares"],
        likeMe: json["like_me"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "content": content,
        "likes": likes,
        "comments": comments,
        "shares": shares,
        "like_me": likeMe,
      };
}

class PostWithUser {
  final PostModel post;
  final UserModel user;

  PostWithUser({required this.post, required this.user});
}
