import 'package:cloud_firestore_database/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void deleteUser(String id) {
  UserController controller = Get.find<UserController>();

  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Are Sure Do you want to delete this User!"),
            SizedBox(height: 15),
            Wrap(
              direction: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('No'),
                ),
                SizedBox(width: 15),
                Obx(() {
                  return ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            await controller.deleteUsers(id);
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
}
