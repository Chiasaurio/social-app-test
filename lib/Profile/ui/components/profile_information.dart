import 'package:flutter/material.dart';
import 'package:prueba/Profile/ui/components/profile_contact_data.dart';
import 'package:prueba/Profile/ui/components/profile_latest_post.dart';

import '../../../Home/models/post_model.dart';
import '../../../Home/models/user_model.dart';
import '../../../constants.dart';

class ProfileInformation extends StatelessWidget {
  final UserModel user;
  final List<PostModel> posts;
  const ProfileInformation(
      {super.key, required this.user, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/icons/share.png',
                    height: 20,
                    color: kTextGreyColor,
                  ),
                  Image.asset(
                    'assets/icons/edit.png',
                    height: 20,
                    color: kTextGreyColor,
                  )
                ],
              ),
            ),
          ),
          ProfileContactData(user: user),
          const SizedBox(
            height: 35,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  'assets/icons/quotes.png',
                  width: 20,
                  color: kDarkPurpleColor,
                ),
                Flexible(
                  child: Text(user.phrase,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 12, color: kTextGreyColor)),
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Latest Post of ${user.name.split(' ')[0]}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      color: kTextBlackColor,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          ProfileLatestPost(posts: posts, user: user),
        ],
      ),
    );
  }
}
