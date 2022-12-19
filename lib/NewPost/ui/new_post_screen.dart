import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/ui/components/Header/header.dart';
import '../../Home/ui/components/Header/sub_header.dart';
import '../../User/cubit/user_cubit.dart';
import '../../constants.dart';
import 'body.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewPostHeader(height: 143 - MediaQuery.of(context).padding.top),
      backgroundColor: kBackGroundColor,
      body: const Body(),
      //  Body(posts: state.posts);
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPurpleColor,
        child: const Icon(Icons.home),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        color: kDarkPurpleColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.transparent,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class NewPostHeader extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const NewPostHeader({super.key, required this.height});
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Column(
                children: [
                  Header(
                      user: state.user, color: Colors.white, obscureText: true),
                  const SubHeader(
                    text: 'New Post',
                    asset: 'cancelar.png',
                    color: Colors.white,
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
