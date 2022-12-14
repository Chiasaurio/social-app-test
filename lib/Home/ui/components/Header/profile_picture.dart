import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Profile/cubit/profile_cubit.dart';
import 'package:prueba/constants.dart';

import '../../../models/user_model.dart';

class ProfilePicture extends StatelessWidget {
  final UserModel user;
  final bool darkText;
  final bool removeInstagram;
  const ProfilePicture(
      {required this.user,
      this.darkText = false,
      this.removeInstagram = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              BlocProvider.of<ProfileCubit>(context).loadProfile(user.userId);
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
                style: TextStyle(
                    fontSize: 14,
                    color: darkText ? kTextBlackColor : Colors.white)),
            Text(removeInstagram ? '' : user.instagram,
                style: TextStyle(
                    fontSize: 10,
                    color: darkText ? kTextBlackColor : Colors.white))
          ],
        )
      ],
    );
  }
}
