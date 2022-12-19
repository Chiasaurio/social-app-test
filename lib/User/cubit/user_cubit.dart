import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Home/models/user_model.dart';
import '../../Home/repositories/database_controller.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  loadUser() async {
    final user = await FirebaseDatabaseController().getUser();
    if (user != null) {
      emit(UserLoaded(user: user));
    }
  }

  loadUserFromId(int id) async {
    final user = await FirebaseDatabaseController().getUser();
    // emit(UserLoaded(user: user));
  }
}
