import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Home/cubit/home_cubit.dart';
import 'package:prueba/Home/ui/body.dart';
import 'package:prueba/Home/ui/components/Header/header.dart';
import 'package:prueba/Home/ui/components/Header/sub_header.dart';
import 'package:prueba/User/cubit/user_cubit.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).loadPosts();
    BlocProvider.of<UserCubit>(context).loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeHeader(height: 143 - MediaQuery.of(context).padding.top),
      backgroundColor: kBackGroundColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomePostLoaded) {
            return Body(posts: state.posts);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPurpleColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/newpost");
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

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const HomeHeader({required this.height, super.key});
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        decoration: const BoxDecoration(
          color: kDarkPurpleColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
        ),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Column(
                children: [Header(user: state.user), const SubHeader()],
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
