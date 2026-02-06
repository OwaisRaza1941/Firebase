import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_series/auth/singup.dart';
import 'package:firebase_series/ui/screens/home_page.dart';
import 'package:flutter/material.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return HomePage(); // user logged in
        } else {
          return SingupPage(); // user not logged in
        }
      },
    );
  }
}
