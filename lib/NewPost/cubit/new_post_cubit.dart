import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Home/models/post_model.dart';
import 'package:prueba/Home/repositories/database_controller.dart';

part 'new_post_state.dart';

class NewPostCubit extends Cubit<NewPostState> {
  NewPostCubit() : super(NewPostInitial());

  Future<bool> postNewPost(PostModel post) async {
    final res = await FirebaseDatabaseController().postPost(post);
    return res;
    // emit(HomePostLoaded(posts: posts));
  }
}
