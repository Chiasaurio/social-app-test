import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Profile/cubit/profile_cubit.dart';

import '../../Home/ui/components/Header/header.dart';
import '../../constants.dart';
import 'components/profile_information.dart';
import 'components/sub_header_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // BlocProvider.of<ProfileCubit>(context).getUserPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ProfileHeader(height: 215 - MediaQuery.of(context).padding.top),
      backgroundColor: kBackGroundColor,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          // if (state is HomePostLoaded) {
          //   return Body(posts: state.posts);
          // } else {
          // return const Center(child: CircularProgressIndicator());
          return ProfileHeader(
              height: 215 - MediaQuery.of(context).padding.top);
          // }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPurpleColor,
        child: const Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/home', (Route<dynamic> route) => false);
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

class ProfileHeader extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const ProfileHeader({super.key, required this.height});
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        decoration: const BoxDecoration(
          color: kBackGroundColor,
        ),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoaded) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Header(
                        user: state.profile,
                        obscureText: true,
                        color: kBackGroundColor,
                        onTapPicture: false,
                      ),
                      SubHeaderProfile(
                        user: state.profile,
                      ),
                    ],
                  ),
                  Positioned.fill(
                    top: 200 - MediaQuery.of(context).padding.top,
                    right: 0,
                    left: 0,
                    child: ProfileInformation(
                      user: state.profile,
                      posts: state.posts,
                    ),
                  ),
                  Positioned(
                    top: 115 - MediaQuery.of(context).padding.top,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(state.profile.imageUrl)),
                  )
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ));
  }
}
