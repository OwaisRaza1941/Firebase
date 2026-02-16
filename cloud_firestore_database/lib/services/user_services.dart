import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  /// Firebase Collection Refrence
  final _usersRef = FirebaseFirestore.instance.collection('users');

  //// Add Users FireStore
  Future<void> usersAdd(String title, String description) async {
    try {
      String id = DateTime.now().microsecondsSinceEpoch.toString();
      await _usersRef.doc(id).set({
        'id': id,
        'title': title,
        'description': description,
      });
    } on FirebaseException {
      rethrow;
    }
  }

  /// Get Users Firesstore
  Stream<List<Map<String, dynamic>>> getUsers() {
    try {
      return _usersRef.snapshots().map((snapshot) {
        return snapshot.docs.map((e) => e.data()).toList();
      });
    } on FirebaseException {
      rethrow;
    }
  }

  //// Updted Users FireStore
  Future<void> usersUpdated(String id, String title, String description) async {
    try {
      await _usersRef.doc(id).update({
        'id': id,
        'title': title,
        'description': description,
      });
    } on FirebaseException {
      rethrow;
    }
  }
}
