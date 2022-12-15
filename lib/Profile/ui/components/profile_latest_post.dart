import 'package:flutter/material.dart';

import '../../../Home/models/post_model.dart';
import '../../../Home/models/user_model.dart';
import '../../../Home/ui/components/Post/custom_expansion_tile.dart';

class ProfileLatestPost extends StatelessWidget {
  final UserModel user;
  final List<PostModel> posts;
  const ProfileLatestPost({super.key, required this.posts, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final postWithUser = PostWithUser(post: posts[index], user: user);
        return CustomExpansionTile(
          post: postWithUser,
          title: SizedBox(),
          // subtitle: Post(post: posts[index]),
          children: const [
            ListTile(title: Text('Aqui va comments')),
          ],
        );
      },
    );
  }
}
