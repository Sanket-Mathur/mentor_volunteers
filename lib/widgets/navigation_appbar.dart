import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:mentor_volunteers/provider/google_sign_in.dart';

// Common appbar for the screens
class NavAppBar extends StatelessWidget implements PreferredSizeWidget {
  NavAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      // Temporary question posting button
      leading: TextButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/QuestionPost');
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogout();
            Navigator.popUntil(context, ModalRoute.withName('/HomePage'));
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}