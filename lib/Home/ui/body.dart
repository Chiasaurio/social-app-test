import 'package:flutter/material.dart';
import 'package:prueba/Home/ui/components/post.dart';

import '../models/post_model.dart';
import 'components/Post/custom_expansion_tile.dart';

// import 'components/Post/custom_expansion_tile.dart';
class Body extends StatelessWidget {
  final List<PostWithUser> posts;
  const Body({required this.posts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            // TextButton(onPressed: _handleTap, child: Text('data')),
            CustomExpansionTile(
              post: posts[index],
              title: SizedBox(),
              // subtitle: Post(post: posts[index]),
              children: const [
                ListTile(title: Text('Aqui va comments')),
              ],
            ),
          ],
        );
      },
    );
  }
}
