import 'package:cloud_firestore_database/models/user_model.dart';
import 'package:cloud_firestore_database/services/user_services.dart';
import 'package:cloud_firestore_database/ui/dailogs/show_error_dialog.dart';
import 'package:cloud_firestore_database/ui/dailogs/show_success_dailog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  /// Instance For User Services
  final UserServices _addUsers = UserServices();

  /// Loading observailbe variable
  RxBool isLoading = false.obs;

  ///RX List
  RxList<UserModel> users = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  //// Add Users Firestore
  Future<void> addUsers(UserModel user) async {
    try {
      isLoading.value = true;
      await _addUsers.usersAdd(user);
      showSuccessDailoge('Users Add Successfully!');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Users Firestore
  void getUser() {
    try {
      isLoading.value = true;
      _addUsers.getUsers().listen((list) {
        users.value = list;
      });
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //// Updated Users Firestore
  Future<void> updatedUsers(UserModel user) async {
    try {
      isLoading.value = true;
      await _addUsers.usersUpdated(user);
      showSuccessDailoge('Users Updated Successfully!');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //// Delete Users Firestore
  Future<void> deleteUsers(String id) async {
    try {
      isLoading.value = true;
      await _addUsers.deleteUsers(id);
      showSuccessDailoge('Users Delete Successfully!');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
