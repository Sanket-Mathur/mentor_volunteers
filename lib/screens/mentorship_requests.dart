import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mentor_volunteers/api/mentor_requests.dart';
import 'package:mentor_volunteers/widgets/navigation_appbar.dart';
import 'package:mentor_volunteers/widgets/slider_menu.dart';

class MentorshipRequests extends StatefulWidget {
  const MentorshipRequests({Key? key}) : super(key: key);

  @override
  State<MentorshipRequests> createState() => _MentorshipRequestsState();
}

class _MentorshipRequestsState extends State<MentorshipRequests> {
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
      body: FutureBuilder<List<Request>>(
        future: getRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: snapshot.data!
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    item.body,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.check_circle,
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
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
