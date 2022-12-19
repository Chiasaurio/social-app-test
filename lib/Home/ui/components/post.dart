import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prueba/Home/models/post_model.dart';
import 'package:prueba/Home/ui/components/Post/post_bottom.dart';
import 'package:prueba/Home/ui/components/Post/post_header.dart';
import 'package:prueba/constants.dart';

class Post extends StatelessWidget {
  final PostWithUser post;
  final Function onTapComments;
  const Post({required this.post, super.key, required this.onTapComments});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 18, top: 16, bottom: 9),
      padding: const EdgeInsets.only(left: 17, right: 8, top: 6, bottom: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PostHeader(user: post.user, post: post.post),
          const SizedBox(
            height: 10,
          ),
          PostContent(post: post.post),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          PostActionsBottom(
            post: post.post,
            toggleComments: onTapComments,
          ),
        ],
      ),
    );
  }
}

class PostContent extends StatefulWidget {
  final PostModel post;
  const PostContent({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  State<PostContent> createState() => _PostContentState();
}

class _PostContentState extends State<PostContent> {
  late String text;
  late String firstHalf;
  late String secondHalf;
  @override
  void initState() {
    text = widget.post.content;

    if (text.length > 100) {
      firstHalf = text.substring(0, 100);
      secondHalf = text.substring(100, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    super.initState();
  }

  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty
        ? Flexible(
            fit: FlexFit.loose,
            child: Text(
              firstHalf,
            ))
        : Row(
            children: <Widget>[
              Flexible(
                  child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          style: const TextStyle(
                              color: kTextBlackColor, fontSize: 11),
                          children: <TextSpan>[
                            TextSpan(
                                text: flag
                                    ? ("$firstHalf ")
                                    : (firstHalf + secondHalf)),
                            TextSpan(
                                text: flag ? " ...More" : "  Less",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    flag = !flag;
                                    setState(() {});
                                  },
                                style: const TextStyle(
                                    color: Colors.blue, fontSize: 11)),
                          ])))
            ],
          );
  }
}
