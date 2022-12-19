import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba/Home/models/post_model.dart';
import 'package:prueba/Home/models/user_model.dart';

class FirebaseDatabaseController {
  Future<List<PostWithUser>> getPosts() async {
    try {
      final db = FirebaseFirestore.instance;
      List<PostWithUser> list = [];
      await db
          .collection("posts")
          .orderBy("timestamp", descending: true)
          .get()
          .then(
        (res) async {
          await Future.wait(res.docs.map((doc) async {
            final post = PostModel.fromJson(doc.data(), doc.id);
            final user = await getUserFromId(post.userId);
            final postWithUser = PostWithUser(post: post, user: user!);
            list.add(postWithUser);
          }));
        },
        onError: (e) => throw Error(),
      );
      // list.sort((a, b) => b.post.timestamp!.compareTo(a.post.timestamp!));
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<List<PostModel>> getUserPosts(int userId) async {
    try {
      final db = FirebaseFirestore.instance;
      List<PostModel> list = [];
      await db
          .collection("posts")
          .orderBy("timestamp", descending: true)
          .where("user_id", isEqualTo: userId)
          .get()
          .then((res) async {
        await Future.wait(res.docs.map((doc) async {
          final post = PostModel.fromJson(doc.data(), doc.id);
          list.add(post);
        }));
      }, onError: (e) {
        throw Error();
      });
      return list;
    } catch (e) {
      return [];
    }
  }

  Future<UserModel?> getUser() async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc("0");
    final user = await docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return UserModel.fromJson(data, int.parse(doc.id));
      },
      onError: (e) => throw Error(),
    );
    return user;
  }

  Future<UserModel?> getUserFromId(int id) async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc("$id");
    final user = await docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return UserModel.fromJson(data, id);
      },
      onError: (e) => throw Error(),
    );
    return user;
  }

  Future<bool> postPost(Map<String, Object> post) async {
    try {
      final db = FirebaseFirestore.instance;
      final timeStamp = FieldValue.serverTimestamp();
      post["timestamp"] = timeStamp;
      return await db
          .collection("posts")
          .add(post)
          .then((DocumentReference doc) => true);
    } catch (e) {
      return false;
    }
  }

  Future<bool> removePost(PostModel post) async {
    try {
      final db = FirebaseFirestore.instance;
      final res = await db.collection("posts").doc(post.postId).delete().then(
            (doc) => true,
            onError: (e) => false,
          );
      return res;
    } catch (e) {
      return false;
    }
  }
}
