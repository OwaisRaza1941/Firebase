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
                  return Card(
                    child: ListTile(
                      title: Text(data[index]['title'].toString()),
                      subtitle: Text(data[index]['description'].toString()),
                    ),
                  );
                },
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddPost());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
