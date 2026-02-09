import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AddPostService {
  /// Database Reference
  final DatabaseReference _postRef = FirebaseDatabase.instance.ref('posts');

  /// Add Post In Firebase Database
  Future<void> addPost(String id, String title, String description) async {
    try {
      await _postRef.child(id).set({
        'id': id,
        'title': title,
        'description': description,
      });
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  /// Read Post In Firebase Database
  Stream<List<Map<dynamic, dynamic>>> getPosts() {
    return _postRef.onValue.map((event) {
      final data = event.snapshot.value;

      if (data == null) return [];

      // Case 1: Map structure
      if (data is Map) {
        return data.values.map((e) => Map<dynamic, dynamic>.from(e)).toList();
      }

      // Case 2: List structure
      if (data is List) {
        return data
            .where((e) => e != null)
            .map((e) => Map<dynamic, dynamic>.from(e))
            .toList();
      }

      return [];
    });
  }
}
