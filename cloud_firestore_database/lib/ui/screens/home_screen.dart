import 'package:cloud_firestore_database/controller/user_controller.dart';
import 'package:cloud_firestore_database/ui/dailogs/delete_user_dailog.dart';
import 'package:cloud_firestore_database/ui/screens/add_firestore_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserController controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        title: Text('Home Screen'),
        centerTitle: true,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          Center(child: CircularProgressIndicator());
        }
        return controller.users.isEmpty
            ? Center(child: Text('No Users Data'))
            : ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  // final data = controller.users[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        AddFirestoreScreen(
                          isUpdated: true,
                          id: controller.users[index].id,
                          title: controller.users[index].title,
                          description: controller.users[index].description,
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(controller.users[index].title),
                        subtitle: Text(controller.users[index].description),
                        trailing: IconButton(
                          onPressed: () {
                            deleteUser(controller.users[index].id ?? '');
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
          Get.to(AddFirestoreScreen(isUpdated: false));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
