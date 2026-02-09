import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showEmptyInputDailoge(String message) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, color: Colors.red),
            Text(message),
          ],
        ),
      ),
    ),
  );
}
