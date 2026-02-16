import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_realtime_database/models/addpost_model.dart';
import 'package:firestore_realtime_database/services/add_post_service.dart';
import 'package:firestore_realtime_database/ui/dailogs/error_dailoge.dart';
import 'package:firestore_realtime_database/ui/dailogs/show_success_dailoge.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController {
  /// AddPost Services Class
  final AddPostService _addPostService = AddPostService();

  ///ObserVailbe List Of Post Data
  RxList<AddPostModel> post = <AddPostModel>[].obs;

  ///Loading Oservaible Variable
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPost();
  }

  //// ADD POST
  Future<void> addPost(AddPostModel post) async {
    try {
      isLoading.value = true;
      await _addPostService.addPost(post);
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
      isLoading.value = true;
      _addPostService.getPosts().listen((list) {
        post.value = list;
      });
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// UPATE POST
  Future<void> updatePost(AddPostModel post) async {
    try {
      await _addPostService.updatePost(post);
      showSuccessDailoge('Updated Post Success');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    }
  }

  /// DELETE POST
  Future<void> deletePost(String id) async {
    try {
      isLoading.value = true;
      await _addPostService.deletePost(id);
      showSuccessDailoge('Delete Post Success');
    } on FirebaseException catch (e) {
      errorDailoge(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
