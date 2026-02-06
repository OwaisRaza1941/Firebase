import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSuccessDialog(String message, {VoidCallback? onOk}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(height: 10),
            Text(
              "Success",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text(message, textAlign: TextAlign.center),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Get.back();
                if (onOk != null) onOk();
              },
              child: Text("OK"),
            ),
          ],
        ),
      ),
    ),
  );
}
