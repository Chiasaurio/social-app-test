import 'package:flutter/material.dart';
import 'package:prueba/Home/ui/home_screen.dart';
import 'package:prueba/Profile/ui/profile_screen.dart';

import 'NewPost/ui/new_post_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (ctx) => const HomeScreen(),
    '/newpost': (_) => const NewPostScreen(),
    '/profile': (_) => const ProfileScreen(),
  };
}
