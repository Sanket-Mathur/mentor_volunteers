import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Displays a popup alert bux for posting requests
Future<void> displayTextRequestDialog(BuildContext context) async {
  String _requestText = "";

  final user = FirebaseAuth.instance.currentUser!;

  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Request Mentor'),
      content: TextField(
        onChanged: (value) {
          _requestText = value;
        },
        controller: TextEditingController()
          ..text = 'I want to apply for your mentorship because ',
        minLines: 1,
        maxLines: null,
      ),
      actions: [
        TextButton(
          onPressed: () {
            // TODO: send request data to the mentor
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
