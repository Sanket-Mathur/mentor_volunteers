import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:mentor_volunteers/provider/google_sign_in.dart';
import 'package:mentor_volunteers/api/short_term_data.dart';

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
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
      // body: Container(
      //   alignment: Alignment.center,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text('Profile'),
      //       const SizedBox(height: 32),
      //       CircleAvatar(
      //         radius: 40,
      //         backgroundImage: NetworkImage(user.photoURL!),
      //       ),
      //       const SizedBox(height: 32),
      //       Text('Name: ' + user.displayName!),
      //       const SizedBox(height: 32),
      //       Text('Email: ' + user.email!),
      //     ],
      //   ),
      // ),
      body: FutureBuilder<List<Question>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Swiper(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(snapshot.data![i].date),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(snapshot.data![i].name),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(snapshot.data![i].content),
                    ],
                  ),
                );
              },
              layout: SwiperLayout.DEFAULT,
            );
          } else {
            return const Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}
