import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorDialog(String message) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: Colors.red, size: 50),
            SizedBox(height: 10),
            Text(
              "Error",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(message, textAlign: TextAlign.center),
            SizedBox(height: 12),
            ElevatedButton(onPressed: () => Get.back(), child: Text("OK")),
          ],
        ),
      ),
    ),
  );
}
