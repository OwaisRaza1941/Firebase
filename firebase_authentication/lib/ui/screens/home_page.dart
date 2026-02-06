import 'package:firebase_series/ui/screens/add_post.dart';
import 'package:firebase_series/ui/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text('Home Screen'),
      ),
      drawer: DrawerClass(),
      body: Column(children: [
          
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddPostScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
