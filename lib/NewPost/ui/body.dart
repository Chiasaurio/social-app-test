import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Home/cubit/home_cubit.dart';
import 'package:prueba/Home/ui/components/Header/profile_picture.dart';
import 'package:prueba/NewPost/cubit/new_post_cubit.dart';
import 'package:prueba/NewPost/ui/components/publish_button.dart';

import '../../User/cubit/user_cubit.dart';
import '../../constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12, right: 18, top: 23),
          height: 190,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 6, bottom: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        if (state is UserLoaded) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: ProfilePicture(
                              user: state.user,
                              darkText: true,
                              removeInstagram: true,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                      TextField(
                        style: const TextStyle(fontSize: 11),
                        controller: _controller,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your text here...',
                            hintStyle: TextStyle(fontSize: 11)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/icons/emojis.png',
                        height: 16,
                        color: kTextGreyColor,
                      ),
                      const Text(
                        '0/2500',
                        style: TextStyle(fontSize: 8, color: kTextGreyColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 40, right: 23, left: 23),
            child: PublishButton(
                text: 'PUBLISH',
                bold: true,
                press: () async {
                  if (_controller.text != '') {
                    final newPost = {
                      "user_id": 0,
                      "content": _controller.text,
                      "likes": 0,
                      "comments": 0,
                      "shares": 0,
                      "like_me": false
                    };
                    final res = await BlocProvider.of<NewPostCubit>(context)
                        .postNewPost(newPost);
                    if (res) {
                      if (!mounted) return;
                      BlocProvider.of<HomeCubit>(context).loadPosts();
                      Navigator.of(context).pop();
                    } else {}
                  }
                }))
      ],
    );
  }
}
