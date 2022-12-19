import 'package:flutter/material.dart';
import 'package:prueba/constants.dart';

class SubHeader extends StatelessWidget {
  final String? text;
  final Color? color;
  final String? asset;
  const SubHeader({super.key, this.text, this.asset, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? kDarkPurpleColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      width: double.infinity,
      height: 40,
      child: SubHeaderContent(
        asset: asset,
        text: text,
      ),
    );
  }
}

class SubHeaderContent extends StatelessWidget {
  final String? text;
  final String? asset;
  const SubHeaderContent({
    Key? key,
    this.text,
    this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 27, right: 27, top: 10, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text ?? 'Latest Post',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: text != null ? kTextBlackColor : Colors.white)),
          GestureDetector(
              onTap: () {},
              child: Image.asset('assets/icons/${asset ?? 'arrow-up.png'}'))
        ],
      ),
    );
  }
}
