import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_realtime_database/services/add_post_service.dart';
import 'package:firestore_realtime_database/ui/dailogs/error_dailoge.dart';
import 'package:firestore_realtime_database/ui/dailogs/show_success_dailoge.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController {
  /// AddPost Services Class
  final AddPostService _addPostService = AddPostService();

  ///ObserVailbe List Of Post Data
  var posts = [].obs;

  ///Loading Oservaible Variable
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPost();
  }

  //// ADD POST
  Future<void> addPost(String id, String title, String description) async {
    try {
      isLoading.value = true;
      await _addPostService.addPost(id, title, description);
      showSuccessDailoge('Add Post Success');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //// Get POST
  void getPost() {
    try {
      _addPostService.getPosts().listen((list) {
        posts.value = list;
      });
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    }
  }
}
