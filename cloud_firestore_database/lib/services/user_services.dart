import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_database/models/user_model.dart';

class UserServices {
  /// Firebase Collection Refrence
  final _usersRef = FirebaseFirestore.instance.collection('users');

  //// Add Users FireStore
  Future<void> usersAdd(UserModel user) async {
    try {
      String id = DateTime.now().microsecondsSinceEpoch.toString();
      user.id = id;
      await _usersRef.doc(id).set(user.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  /// Get Users Firesstore
  Stream<List<UserModel>> getUsers() {
    try {
      return _usersRef.snapshots().map((snapshot) {
        return snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
      });
    } on FirebaseException {
      rethrow;
    }
  }

  //// Updated Users FireStore
  Future<void> usersUpdated(UserModel user) async {
    try {
      await _usersRef.doc(user.id!).update(user.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  /// Delete User FireStore
  Future<void> deleteUsers(String id) async {
    try {
      return await _usersRef.doc(id).delete();
    } on FirebaseException {
      rethrow;
    }
  }
}
