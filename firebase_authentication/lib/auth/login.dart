import 'package:firebase_series/constants/style.dart';
import 'package:firebase_series/controller/auth_controller.dart';
import 'package:firebase_series/ui/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final AuthController controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/carrot.png', width: 70, height: 70),
              ),
              SizedBox(height: 80),
              Text(
                'Loging',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Enter your emails and password'),
              SizedBox(height: 25),
              Text('Email'),
              Textfields(
                hintText: 'johndoe@gmail.com',
                enabledBorderColor: Colors.grey,
                focusedBorderColor: Colors.grey,
                ctrl: emailController,
              ),
              SizedBox(height: 30),
              Text('Password'),
              Obx(() {
                return TextField(
                  obscureText: controller.obscurePassword.value,
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        controller.obscurePassword.toggle();
                      },
                    ),
                  ),
                );
              }),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text('Forgot Password?')],
              ),
              SizedBox(height: 30),

              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Get.snackbar('Error', 'All Feilds Required');
                              return;
                            }
                            await controller.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                    style: AppStyles.buttonStyle,
                    child: controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('LogIn', style: TextStyle(fontSize: 18)),
                  ),
                );
              }),

              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Singup', style: TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
