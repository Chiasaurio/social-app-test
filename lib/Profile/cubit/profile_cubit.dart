import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Home/models/post_model.dart';
import 'package:prueba/Home/models/user_model.dart';

import '../../Home/repositories/database_controller.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadProfile(int userId) async {
    final user = await FirebaseDatabaseController().getUserFromId(userId);
    final posts = await FirebaseDatabaseController().getUserPosts(userId);
    if (user != null) {
      emit(ProfileLoaded(profile: user, posts: posts));
    }
  }
}
