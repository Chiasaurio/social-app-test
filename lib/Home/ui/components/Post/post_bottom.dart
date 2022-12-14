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
            onTap: () {
              print('like');
            },
            child: Image.asset(
              'assets/icons/like.png',
              height: 16,
              color: post.likeMe ? kLikeColor : kTextGreyColor,
            )),
        const Text('30', style: TextStyle(fontSize: 7, color: kTextGreyColor)),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              print('comments');
              toggleComments();
            },
            child: Image.asset(
              'assets/icons/comment.png',
              height: 16,
              color: kTextGreyColor,
            )),
        const Text('3', style: TextStyle(fontSize: 7, color: kTextGreyColor)),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              print('share');
            },
            child: Image.asset(
              'assets/icons/share.png',
              height: 16,
              color: kTextGreyColor,
            )),
        const Text('34', style: TextStyle(fontSize: 7, color: kTextGreyColor)),
      ],
    );
  }
}
