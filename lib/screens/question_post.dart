import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mentor_volunteers/api/short_term_data.dart';
import 'package:mentor_volunteers/widgets/navigation_appbar.dart';
import 'package:mentor_volunteers/widgets/slider_menu.dart';

// Question post screen
class QuestionPost extends StatefulWidget {
  const QuestionPost({Key? key}) : super(key: key);

  @override
  _QuestionPostState createState() => _QuestionPostState();
}

class _QuestionPostState extends State<QuestionPost> {
  String _title = "", _content = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      drawer: const SliderMenu(),
      appBar: NavAppBar(
        scaffoldKey: scaffoldKey,
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Ask from mentors',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      _title = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.white,
                    ),
                    maxLength: 100,
                    buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) {
                      return Container(
                        transform:
                            Matrix4.translationValues(0, -kToolbarHeight, 0),
                        child: Text("$currentLength/$maxLength"),
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title is required';
                      }
                    },
                  ),
                  TextFormField(
                    onChanged: (value) {
                      _content = value;
                    },
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.white,
                    ),
                    maxLength: 1000,
                    maxLines: 20,
                    buildCounter: (context,
                        {required currentLength,
                        required isFocused,
                        maxLength}) {
                      return Container(
                        transform:
                            Matrix4.translationValues(0, -kToolbarHeight, 0),
                        child: Text("$currentLength/$maxLength"),
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Question body is required';
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      final months = [
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec"
                      ];

                      DateTime currentDate = DateTime.now();
                      String date = currentDate.day.toString() +
                          " " +
                          months[currentDate.month - 1] +
                          ", " +
                          currentDate.year.toString();

                      Question question = Question(Random().nextInt(9999), user.displayName!, date, _title, _content);

                      // TODO: Send data to server

                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Center(
                            child: Text("Submitted"),
                          ),
                        ),
                      );
                    },
                    child: const Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
