// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba/Home/models/user_model.dart';

class PostModel extends Equatable {
  const PostModel({
    required this.userId,
    required this.postId,
    required this.content,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.likeMe,
    this.timestamp,
  });

  final String postId;
  final int userId;
  final int? timestamp;
  final String content;
  final int likes;
  final int comments;
  final int shares;
  final bool likeMe;

  factory PostModel.fromJson(Map<String, dynamic> json, String id) => PostModel(
        postId: id,
        userId: json["user_id"],
        content: json["content"],
        likes: json["likes"],
        comments: json["comments"],
        shares: json["shares"],
        likeMe: json["like_me"],
        timestamp: (json["timestamp"] as Timestamp).millisecondsSinceEpoch,
      );

  factory PostModel.addTimeStamp(PostModel model, int timestamp) {
    return PostModel(
      timestamp: timestamp,
      postId: model.postId,
      userId: model.userId,
      content: model.content,
      likes: model.likes,
      comments: model.comments,
      shares: model.shares,
      likeMe: model.likeMe,
    );
  }
  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "user_id": userId,
        "content": content,
        "likes": likes,
        "comments": comments,
        "shares": shares,
        "like_me": likeMe,
      };

  @override
  List<Object?> get props => [
        postId,
        userId,
        content,
        likes,
        comments,
        shares,
        likeMe,
        timestamp,
      ];
}

class PostWithUser extends Equatable {
  final PostModel post;
  final UserModel user;

  const PostWithUser({required this.post, required this.user});

  @override
  List<Object?> get props => [post, user];
}
