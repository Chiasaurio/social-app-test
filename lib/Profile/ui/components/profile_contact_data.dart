import 'package:flutter/material.dart';

import '../../../Home/models/user_model.dart';
import '../../../constants.dart';

class ProfileContactData extends StatelessWidget {
  final UserModel user;
  const ProfileContactData({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(user.name, style: const TextStyle(fontSize: 17)),
            Text(user.instagram, style: const TextStyle(fontSize: 14)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/cil_location-pin.png',
                      height: 16,
                      color: kTextGreyColor,
                    ),
                    Flexible(
                      child: Text(user.city,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 11, color: kTextGreyColor)),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/carbon_location-company.png',
                      height: 16,
                      color: kTextGreyColor,
                    ),
                    Flexible(
                      child: Text(user.company,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 11, color: kTextGreyColor)),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/phone.png',
                      height: 16,
                      color: kTextGreyColor,
                    ),
                    Flexible(
                      child: Text(user.phone,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 11, color: kTextGreyColor)),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
