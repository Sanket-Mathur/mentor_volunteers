import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mentor_volunteers/screens/login.dart';
import 'package:mentor_volunteers/screens/short_term.dart';

// Redirecting as per user sign-in
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const ShortTerm();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Something Went Wrong!'),
          );
        } else {
          return const Login();
        }
      },
    );
  }
}
