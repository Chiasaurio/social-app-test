import 'package:firebase_database/firebase_database.dart';
import 'package:prueba/Home/models/post_model.dart';
import 'package:prueba/Home/models/user_model.dart';

class FirebaseDatabaseController {
  Future<List<PostWithUser>> getPosts() async {
    try {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('posts/').get();
      Iterable list = [];
      if (snapshot.value.runtimeType == List<Object?>) {
        list = snapshot.value as List;
      } else {
        final map = snapshot.value as Map;
        Map auxMap = map;
        map.forEach((key, value) {
          auxMap[key]["firebase_id"] = key;
        });
        list = auxMap.values;
      }

      List<PostWithUser> posts = [];
      for (var e in list) {
        final aux = e as Map;
        Map<String, dynamic> auxMap = {};
        aux.forEach((key, value) {
          auxMap[key.toString()] = value;
        });

        final auxPost = PostModel.fromJson(auxMap);
        final userSnapshot =
            await ref.child('users/${auxPost.userId.toString()}').get();
        Map<String, dynamic> userMap = {};
        final userList = userSnapshot.value as Map;

        userList.forEach((key, value) {
          userMap[key.toString()] = value;
        });

        final postWithUser =
            PostWithUser(post: auxPost, user: UserModel.fromJson(userMap));

        posts.add(
            // PostModel.fromJson(auxMap)
            postWithUser);
      }

      return posts;
    } catch (e) {
      return [];
    }
  }

  Future<List<PostWithUser>> getUserPosts() async {
    try {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref
          .child('posts/')
          .orderByChild('user_id')
          .equalTo(0)
          .once()
          .then((snapshot) {
        print('askdjasd');
      });
      List<PostWithUser> posts = [];

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<PostModel>> getUserPosts2(int userId) async {
    try {
      final ref = FirebaseDatabase.instance.ref();
      Iterable list = [];
      await ref
          .child('posts/')
          .orderByChild('user_id')
          .equalTo(userId)
          .once()
          .then((snapshot) {
        // list = snapshot.snapshot.value as List;
        if (snapshot.snapshot.value.runtimeType == List<Object?>) {
          list = snapshot.snapshot.value as List;
        } else {
          final map = snapshot.snapshot.value as Map;
          Map auxMap = map;
          map.forEach((key, value) {
            auxMap[key]["firebase_id"] = key;
          });
          list = auxMap.values;
        }
      });
      List<PostModel> posts = [];
      for (var e in list) {
        if (e != null) {
          final aux = e as Map;
          Map<String, dynamic> auxMap = {};
          aux.forEach((key, value) {
            auxMap[key.toString()] = value;
          });
          posts.add(PostModel.fromJson(auxMap));
        }
      }
      return posts;
    } catch (e) {
      return [];
    }
  }

  Future<UserModel> getUser() async {
    final ref = FirebaseDatabase.instance.ref();
    final userSnapshot = await ref.child('users/0').get();
    Map<String, dynamic> userMap = {};
    final userList = userSnapshot.value as Map;

    userList.forEach((key, value) {
      userMap[key.toString()] = value;
    });
    return UserModel.fromJson(userMap);
  }

  Future<UserModel> getUserFromId(int id) async {
    final ref = FirebaseDatabase.instance.ref();
    final userSnapshot = await ref.child('users/$id').get();
    Map<String, dynamic> userMap = {};
    final userList = userSnapshot.value as Map;

    userList.forEach((key, value) {
      userMap[key.toString()] = value;
    });
    return UserModel.fromJson(userMap);
  }

  Future<bool> postPost(PostModel post) async {
    try {
      final ref = FirebaseDatabase.instance.ref('posts/');
      final newPostRef = ref.push();
      await newPostRef.set(post.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removePost(PostModel post) async {
    try {
      final ref = FirebaseDatabase.instance.ref('posts/${post.firebaseId}');
      await ref.remove();
      return true;
    } catch (e) {
      return false;
    }
  }
}
