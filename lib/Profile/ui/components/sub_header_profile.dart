import 'package:flutter/material.dart';

import '../../../Home/models/user_model.dart';

class SubHeaderProfile extends StatelessWidget {
  final UserModel user;
  const SubHeaderProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImageUrl),
          fit: BoxFit.fitWidth,
        ),
      ),
      width: double.infinity,
      height: 88,
    );
  }
}
