import 'package:flutter/material.dart';

import 'package:mentor_volunteers/widgets/navigation_appbar.dart';
import 'package:mentor_volunteers/widgets/slider_menu.dart';
import 'package:mentor_volunteers/screens/browse_mentors.dart';

class MentorCategory extends StatelessWidget {
  MentorCategory({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      drawer: const SliderMenu(),
      appBar: NavAppBar(
        scaffoldKey: scaffoldKey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'SELECT CATEGORY',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'VOLUNTEER',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              child: const Text(
                'Free',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrowseMentor(
                    category: 0,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size.fromHeight(50),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'CATEGORY 1',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              child: const Text(
                '\$ 10 / month',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrowseMentor(
                    category: 1,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size.fromHeight(50),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'CATEGORY 2',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              child: const Text(
                '\$ 25 / month',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrowseMentor(
                    category: 2,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size.fromHeight(50),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              'CATEGORY 3',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              child: const Text(
                '\$ 50 / month',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrowseMentor(
                    category: 3,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size.fromHeight(50),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
