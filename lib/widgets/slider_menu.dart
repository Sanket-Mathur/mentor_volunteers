import 'package:flutter/material.dart';

class SliderMenu extends StatelessWidget {
  const SliderMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              child: const Text('Home'),
              onPressed: () => Navigator.pushNamed(context, '/ShortTerm'),
            ),
            TextButton(
              child: const Text('Add Question'),
              onPressed: () => Navigator.pushNamed(context, '/QuestionPost'),
            ),
            TextButton(
              child: const Text('Account'),
              onPressed: () {}, // TODO: Add an account page
            ),
            Expanded(child: Container()),
            ElevatedButton(
              child: const Text('Find a Mentor'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('Become a Mentor'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
