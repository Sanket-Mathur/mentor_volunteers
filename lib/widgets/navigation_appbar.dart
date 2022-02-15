import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Common appbar for the screens
class NavAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  NavAppBar({Key? key, required this.scaffoldKey})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          onPressed: () => Navigator.pushNamed(context, '/Account'),
        )
      ],
    );
  }
}
