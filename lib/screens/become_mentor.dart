import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mentor_volunteers/widgets/navigation_appbar.dart';
import 'package:mentor_volunteers/widgets/slider_menu.dart';

// Become Mentor page for applying as a mentor
class BecomeMentor extends StatefulWidget {
  const BecomeMentor({Key? key}) : super(key: key);

  @override
  _BecomeMentorState createState() => _BecomeMentorState();
}

class _BecomeMentorState extends State<BecomeMentor> {
  int _category = 0;
  String _bio = "";

  final user = FirebaseAuth.instance.currentUser!;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = user.displayName!;
    emailController.text = user.email!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      drawer: const SliderMenu(),
      appBar: NavAppBar(
        scaffoldKey: scaffoldKey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'BECOME A MENTOR',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                readOnly: true,
                enabled: false,
                controller: nameController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                readOnly: true,
                enabled: false,
                controller: emailController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.white,
                    style: BorderStyle.solid,
                    width: 0.50,
                  ),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.black,
                  ),
                  child: DropdownButton<int>(
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    items: const [
                      DropdownMenuItem(
                        child: Text('VOLUNTEER - FREE'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('CATEGORY 1 - \$ 10 / month'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('CATEGORY 2 - \$ 25 / month'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('CATEGORY 3 - \$ 50 / month'),
                        value: 3,
                      ),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _category = value!;
                      });
                    },
                    value: _category,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  _bio = value;
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
                maxLength: 250,
                maxLines: 5,
                buildCounter: (context,
                    {required currentLength, required isFocused, maxLength}) {
                  return Container(
                    transform: Matrix4.translationValues(0, -kToolbarHeight, 0),
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
                child: const Text('Create Mentor Account'),
                onPressed: () {
                  // TODO: Add mentor data and access to database
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
