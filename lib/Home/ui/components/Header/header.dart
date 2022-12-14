import 'package:flutter/material.dart';
import 'package:prueba/Home/models/user_model.dart';
import 'package:prueba/Home/ui/components/Header/profile_picture.dart';
import 'package:prueba/constants.dart';

import 'header_actions.dart';

class Header extends StatelessWidget {
  final UserModel user;
  final Color? color;
  final bool obscureText;
  const Header(
      {required this.user, this.obscureText = false, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? kPurpleColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      width: double.infinity,
      height: 103 - MediaQuery.of(context).padding.top,
      // height: small ? 103 - MediaQuery.of(context).padding.top : 103,
      child: HeaderContent(user: user, obscureText: obscureText),
    );
  }
}

class HeaderContent extends StatelessWidget {
  final UserModel user;
  final bool obscureText;

  const HeaderContent({
    required this.user,
    required this.obscureText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 24.22, right: 18.36, top: 23.0, bottom: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfilePicture(user: user, darkText: obscureText),
          HeaderActions(darkIcon: obscureText),
        ],
      ),
    );
  }
}
