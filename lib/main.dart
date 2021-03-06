import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:mentor_volunteers/provider/google_sign_in.dart';
import 'package:mentor_volunteers/screens/home_page.dart';
import 'package:mentor_volunteers/screens/short_term.dart';
import 'package:mentor_volunteers/screens/question_post.dart';
import 'package:mentor_volunteers/screens/account.dart';
import 'package:mentor_volunteers/screens/mentor_category.dart';
import 'package:mentor_volunteers/screens/mentor_register.dart';
import 'package:mentor_volunteers/screens/mentorship_requests.dart';
import 'package:mentor_volunteers/screens/mentorship_accepted.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// parent application widget
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Career 1-1',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const LandingPage(),
          '/HomePage': (BuildContext context) => const HomePage(),
          '/ShortTerm': (BuildContext context) => ShortTerm(),
          '/QuestionPost': (BuildContext context) => const QuestionPost(),
          '/Account': (BuildContext context) => const Account(),
          '/FindMentor': (BuildContext context) => MentorCategory(),
          '/BecomeMentor': (BuildContext context) => const BecomeMentor(),
          '/Requests': (BuildContext context) => const MentorshipRequests(),
          '/Accepted': (BuildContext context) => MentorshipAccepted(),
        },
      ),
    );
  }
}

// Splash Screen
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
    Navigator.pushReplacementNamed(context, '/HomePage');
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
                  fontWeight: FontWeight.normal,
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
