import 'dart:async';
import 'package:flutter/material.dart';

import 'screens/Login.dart';

// parent application widget
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Career 1-1',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: const LandingPage(),
    ));

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LandingPageState();
  }
}

class LandingPageState extends State<LandingPage> {
  // timer for 4 seconds before redirecting from splash screen
  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  // route to login page with page replacement
  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 45),
              child: Text(
                'Career 1-1',
                style: TextStyle(
                  fontSize: 66,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Provide the career guidance you were seeking for.',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}