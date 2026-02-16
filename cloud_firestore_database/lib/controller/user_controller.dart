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
  var users = [].obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  //// Add Users FireStore
  Future<void> addUsers(String title, String description) async {
    try {
      isLoading.value = true;
      await _addUsers.usersAdd(title, description);
      showSuccessDailoge('Users Add Successfully');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Users Firesstore
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

  //// Updted Users FireStore
  Future<void> updatedUsers(String id, String title, String description) async {
    try {
      isLoading.value = true;
      await _addUsers.usersUpdated(id, title, description);
      showSuccessDailoge('Users Add Updated');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
