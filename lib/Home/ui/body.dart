import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'components/Post/custom_expansion_tile.dart';

// import 'components/Post/custom_expansion_tile.dart';
class Body extends StatefulWidget {
  final List<PostWithUser> posts;
  const Body({required this.posts, super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List<PostWithUser> _posts;
  @override
  void initState() {
    _posts = widget.posts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CustomExpansionTile(
              post: _posts[index],
              title: const SizedBox(),
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
