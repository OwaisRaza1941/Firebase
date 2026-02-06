import 'package:firebase_series/auth/login.dart';
import 'package:firebase_series/constants/style.dart';
import 'package:firebase_series/controller/auth_controller.dart';
import 'package:firebase_series/ui/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
                'Sing Up',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('Enter your credentials to continue'),
              SizedBox(height: 25),
              Text('Username'),
              Textfields(
                hintText: 'UserName',
                enabledBorderColor: Colors.grey,
                focusedBorderColor: Colors.green,
              ),
              SizedBox(height: 20),
              Text('Email'),
              Textfields(
                hintText: 'johndoe@gmail.com',
                enabledBorderColor: Colors.grey,
                focusedBorderColor: Colors.green,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'By continuing you agree to our  \nand privacy policy.  ',
                  ),
                  Text(
                    "Terms of Services",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Obx(() {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null // disable button while loading
                        : () async {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Get.snackbar('Error', 'All Fields Required');
                              return;
                            }
                            await controller.singUp(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                    style: AppStyles.buttonStyle,
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          )
                        : Text('Sign UP', style: TextStyle(fontSize: 18)),
                  ),
                );
              }),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Get.to(LoginPage());
                    },
                    child: Text('Login', style: TextStyle(color: Colors.grey)),
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
