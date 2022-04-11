import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mentor_volunteers/api/short_term_data.dart';

// Displays a popup alert bux for posting answers
Future<void> displayTextInputDialog(
    BuildContext context, Question question) async {
  String _answerText = "";

  final user = FirebaseAuth.instance.currentUser!;

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(question.title),
      content: TextField(
        onChanged: (value) {
          _answerText = value;
        },
        decoration: const InputDecoration(hintText: "Write your answer"),
        minLines: 1,
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () async {
            if (_answerText.isEmpty) {
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

            Answer answer = Answer(
                Random().nextInt(9999), user.displayName!, date, _answerText);
            final response = await postAnswer(question.id, answer);

            final String result;

            if (response == 200) {
              Navigator.pop(context);
              result = "Submitted";
            } else {
              result = "An error occurred! Please try again.";
            }

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(
                  child: Text(result),
                ),
              ),
            );
          },
          child: const Text(
            'Submit',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        )
      ],
    ),
  );
}
