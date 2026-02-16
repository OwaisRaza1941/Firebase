import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firestore_realtime_database/models/addpost_model.dart';

class AddPostService {
  /// Database Reference
  final DatabaseReference _postRef = FirebaseDatabase.instance.ref('posts');

  /// Add Post In Firebase Database
  Future<void> addPost(AddPostModel post) async {
    try {
      final id = _postRef.push().key!;
      post.id = id;
      await _postRef.child(id).set(post.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  /// Read Post In Firebase Database
  Stream<List<AddPostModel>> getPosts() {
    return _postRef.onValue.map((event) {
      final data = event.snapshot.value;

      if (data == null) return [];

      // Case 1: Map structure
      if (data is Map) {
        return data.entries.map((e) {
          final map = Map<String, dynamic>.from(e.value);
          return AddPostModel.fromMap(map, e.key);
        }).toList();
      }

      // Case 2: List structure
      if (data is List) {
        return data.where((e) => e != null).map((e) {
          final map = Map<String, dynamic>.from(e);
          return AddPostModel.fromMap(map, map['id']);
        }).toList();
      }

      return [];
    });
  }

  /// Update Post in Firebase Database
  Future<void> updatePost(AddPostModel post) async {
    try {
      await _postRef.child(post.id!).update(post.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  /// Delete Post in Firebase Database
  Future<void> deletePost(String id) async {
    try {
      await _postRef.child(id).remove();
    } on FirebaseException {
      rethrow;
    }
  }
}
