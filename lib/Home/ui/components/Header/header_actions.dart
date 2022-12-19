import 'package:flutter/material.dart';
import 'package:prueba/constants.dart';

class HeaderActions extends StatelessWidget {
  final bool actionsGrey;
  final bool darkIcon;
  const HeaderActions(
      {this.actionsGrey = false, this.darkIcon = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/search.png',
              color: actionsGrey
                  ? kTextGreyColor
                  : darkIcon
                      ? kTextBlackColor
                      : Colors.white,
            )),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/icons/menu.png',
              color: actionsGrey
                  ? kTextGreyColor
                  : darkIcon
                      ? kTextBlackColor
                      : Colors.white,
            ))
      ],
    );
  }
}
