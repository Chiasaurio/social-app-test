import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../models/post_model.dart';

class PostActionsBottom extends StatelessWidget {
  final PostModel post;
  final Function toggleComments;
  const PostActionsBottom({
    required this.post,
    required this.toggleComments,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/like.png',
              height: 16,
              color: post.likeMe ? kLikeColor : kTextGreyColor,
            )),
        Text(post.likes.toString(),
            style: const TextStyle(fontSize: 7, color: kTextGreyColor)),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              toggleComments();
            },
            child: Image.asset(
              'assets/icons/comment.png',
              height: 16,
              color: kTextGreyColor,
            )),
        Text(post.comments.toString(),
            style: const TextStyle(fontSize: 7, color: kTextGreyColor)),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/share.png',
              height: 16,
              color: kTextGreyColor,
            )),
        Text(post.shares.toString(),
            style: const TextStyle(fontSize: 7, color: kTextGreyColor)),
      ],
    );
  }
}
