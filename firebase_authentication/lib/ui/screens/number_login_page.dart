import 'package:firebase_series/controller/phone_aut_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    final PhoneAutController controller = Get.find<PhoneAutController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your mobile number',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Text('Mobile Number'),
              TextField(
                keyboardType: TextInputType.number,
                controller: numberController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.sendOtp(numberController.text.trim());
                        },
                  child: controller.isLoading.value
                      ?   CircularProgressIndicator(color: Colors.white)
                      :   Text('Verify Phone Number'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
