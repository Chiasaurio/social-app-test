import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Home/models/post_model.dart';
import 'package:prueba/Home/models/user_model.dart';
import 'package:prueba/Home/ui/components/Post/delete_confirmation_dialog.dart';
import 'package:prueba/constants.dart';

import '../../../../Profile/cubit/profile_cubit.dart';

class PostHeader extends StatelessWidget {
  final UserModel user;
  final PostModel post;
  const PostHeader({required this.user, required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  BlocProvider.of<ProfileCubit>(context)
                      .loadProfile(user.userId);
                  Navigator.pushNamed(context, '/profile');
                },
                child: CircleAvatar(
                    radius: 16, backgroundImage: NetworkImage(user.imageUrl))),
            const SizedBox(
              width: 10.78,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.name,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
                Text('${user.lastConnection} hours ago',
                    style:
                        const TextStyle(fontSize: 10, color: kTextBlackColor))
              ],
            ),
          ],
        ),
        PostActions(post: post),
      ],
    );
  }
}

class PostActions extends StatefulWidget {
  final PostModel post;
  const PostActions({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/edit.png',
              height: 13,
              color: kTextGreyColor,
            )),
        const SizedBox(
          width: 6,
        ),
        GestureDetector(
            onTap: () async {
              showDeleteConfirmationDialog(context, widget.post, mounted);
              // final res = await BlocProvider.of<HomeCubit>(context)
              //     .removePost(widget.post);
              // if (res) {
              //   if (!mounted) return;
              //   BlocProvider.of<HomeCubit>(context).loadComments();
              // }
            },
            child: Image.asset(
              'assets/icons/delete.png',
              height: 15,
              color: kTextGreyColor,
            )),
      ],
    );
  }
}
