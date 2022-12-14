import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/Home/models/post_model.dart';
import 'package:prueba/Home/models/user_model.dart';
import '../repositories/database_controller.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  loadPosts() async {
    List<PostWithUser> posts = await FirebaseDatabaseController().getPosts();
    emit(HomePostLoaded(posts: posts));
  }

  removePost(PostModel post) async {
    final result = await FirebaseDatabaseController().removePost(post);
    return result;
  }
}
