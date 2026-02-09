import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_realtime_database/controller/add_post_controller.dart';
import 'package:firestore_realtime_database/firebase_options.dart';
import 'package:firestore_realtime_database/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AddPostController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
