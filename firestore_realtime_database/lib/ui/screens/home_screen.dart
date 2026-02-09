import 'package:firestore_realtime_database/controller/add_post_controller.dart';
import 'package:firestore_realtime_database/ui/screens/add_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddPostController controller = Get.find<AddPostController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.posts.isEmpty
            ? Center(child: Text('No Post Data'))
            : ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context, index) {
                  final data = controller.posts;
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        AddPost(
                          id: data[index]['id'],
                          title: data[index]['title'],
                          des: data[index]['description'],
                          isUpdated: true,
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(data[index]['title'].toString()),
                        subtitle: Text(data[index]['description'].toString()),
                        trailing: IconButton(
                          onPressed: () {
                            Get.dialog(
                              Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Do you want to delete this Post!'),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text('No'),
                                          ),
                                          SizedBox(width: 10),
                                          Obx(() {
                                            return ElevatedButton(
                                              onPressed:
                                                  controller.isLoading.value
                                                  ? null
                                                  : () async {
                                                      await controller
                                                          .deletePost(
                                                            data[index]['id'],
                                                          );
                                                    },
                                              child: controller.isLoading.value
                                                  ? CircularProgressIndicator()
                                                  : Text('Yes'),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddPost(isUpdated: false));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
