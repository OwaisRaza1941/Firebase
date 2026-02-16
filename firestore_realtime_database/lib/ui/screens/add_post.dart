import 'package:firestore_realtime_database/controller/add_post_controller.dart';
import 'package:firestore_realtime_database/models/addpost_model.dart';
import 'package:firestore_realtime_database/ui/dailogs/show_empty_input_dailoge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPost extends StatelessWidget {
  final String? id;
  final String? title;
  final String? des;
  final bool isUpdated;
  const AddPost({
    super.key,
    this.id,
    this.title,
    this.des,
    required this.isUpdated,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: title ?? '',
    );
    TextEditingController desController = TextEditingController(
      text: des ?? '',
    );
    final AddPostController controller = Get.find<AddPostController>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: Text(isUpdated ? 'Updated Post' : 'Add Post'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                child: TextField(
                  controller: desController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What are your mind?',
                  ),
                ),
              ),

              SizedBox(height: 20),

              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            if (titleController.text.isEmpty ||
                                desController.text.isEmpty) {
                              showEmptyInputDailoge(
                                'Please fill in the inputs!',
                              );
                              return;
                            }

                            if (isUpdated) {
                              AddPostModel post = AddPostModel(
                                id: id,
                                title: titleController.text,
                                description: desController.text,
                              );
                              await controller.updatePost(post);
                            } else {
                              AddPostModel post = AddPostModel(
                                title: titleController.text,
                                description: desController.text,
                              );
                              await controller.addPost(post);
                            }
                          },
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Submit'),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
