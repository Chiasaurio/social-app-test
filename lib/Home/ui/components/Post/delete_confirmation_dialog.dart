import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/components/darkpurple_button.dart';
import 'package:prueba/components/purple_button.dart';
import 'package:prueba/constants.dart';

import '../../../cubit/home_cubit.dart';
import '../../../models/post_model.dart';

showDeleteConfirmationDialog(BuildContext context, PostModel post, mounted) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          // contentPadding: const EdgeInsets.only(top: 50.0, bottom: 20,),
          insetPadding: const EdgeInsets.symmetric(horizontal: 50),
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Image.asset(
                        'assets/icons/delete.png',
                        height: 40,
                        width: 40,
                        color: kTextBlackColor,
                      ),
                      const Text(
                        'Delete post?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: kTextBlackColor),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          width: 150,
                          child: DarkPurpleButton(
                            text: 'Yes',
                            press: () async {
                              final res =
                                  await BlocProvider.of<HomeCubit>(context)
                                      .removePost(post);
                              if (res) {
                                if (!mounted) return;
                                BlocProvider.of<HomeCubit>(context).loadPosts();
                                Navigator.of(context).pop();
                              }
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 150,
                          child: PurpleButton(
                            text: 'No',
                            press: () {
                              Navigator.pop(context);
                            },
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
