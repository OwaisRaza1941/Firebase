import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_series/controller/auth_controller.dart';
import 'package:firebase_series/controller/phone_aut_controller.dart';
import 'package:firebase_series/ui/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'firebase_options.dart'; // 👈 Ye file FlutterFire CLI ne generate ki hai
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // 👈 Platform specific config
  );
  Get.put(AuthController(), permanent: true);
  Get.put(PhoneAutController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
