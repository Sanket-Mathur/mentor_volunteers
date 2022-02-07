import 'package:flutter/material.dart';

import 'package:mentor_volunteers/api/short_term_data.dart';

Future<void> displayTextInputDialog(
    BuildContext context, Question question) async {
  String answer = "";

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(question.title),
      content: TextField(
        onChanged: (value) {
          answer = value;
        },
        decoration: const InputDecoration(hintText: "Write your answer"),
        minLines: 1,
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () {

          },
          child: const Text('Submit'),
        )
      ],
    ),
  );
}
