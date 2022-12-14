import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Home/cubit/home_cubit.dart';
import 'package:prueba/Home/ui/home_screen.dart';
import 'package:prueba/NewPost/cubit/new_post_cubit.dart';
import 'package:prueba/Profile/cubit/profile_cubit.dart';
import 'package:prueba/User/cubit/user_cubit.dart';
import 'package:prueba/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
        BlocProvider<NewPostCubit>(create: (context) => NewPostCubit()),
        BlocProvider<ProfileCubit>(create: (context) => ProfileCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/home",
        routes: Routes.routes,
        home: const HomeScreen(),
      ),
    );
  }
}
