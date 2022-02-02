import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:mentor_volunteers/provider/google_sign_in.dart';

// Dummy page for short-term mentorship
class ShortTerm extends StatelessWidget {
  const ShortTerm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profile'),
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(height: 32),
            Text('Name: ' + user.displayName!),
            const SizedBox(height: 32),
            Text('Email: ' + user.email!),
          ],
        ),
      ),
    );
  }
}
