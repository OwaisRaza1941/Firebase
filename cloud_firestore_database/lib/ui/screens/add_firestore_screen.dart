import 'package:cloud_firestore_database/controller/user_controller.dart';
import 'package:cloud_firestore_database/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFirestoreScreen extends StatelessWidget {
  final String? id;
  final String? title;
  final String? description;
  final bool isUpdated;
  const AddFirestoreScreen({
    super.key,
    this.id,
    this.title,
    this.description,
    required this.isUpdated,
  });

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find<UserController>();
    TextEditingController titleController = TextEditingController(
      text: title ?? '',
    );
    TextEditingController desController = TextEditingController(
      text: description ?? '',
    );
    return GestureDetector(
      onTap: () {
        Focus.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          title: Text('Add Post'),
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
                              Get.snackbar(
                                'Hi,',
                                'Please All the fields required!',
                              );
                              return;
                            }

                            if (isUpdated) {
                              UserModel user = UserModel(
                                id: id,
                                title: titleController.text,
                                description: desController.text,
                              );
                              await controller.updatedUsers(user);
                            } else {
                              UserModel user = UserModel(
                                title: titleController.text,
                                description: desController.text,
                              );
                              await controller.addUsers(user);
                            }
                          },
                    child: controller.isLoading.value
                        ? CircularProgressIndicator()
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
