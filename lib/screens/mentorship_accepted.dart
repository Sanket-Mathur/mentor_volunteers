import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:mentor_volunteers/api/mentor_requests.dart';
import 'package:mentor_volunteers/widgets/navigation_appbar.dart';
import 'package:mentor_volunteers/widgets/slider_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorshipAccepted extends StatelessWidget {
  MentorshipAccepted({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          const Center(
            child: Text(
              'MENTEES',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<Request>>(
            future: getRequests(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: snapshot.data!
                          .map(
                            (item) => TextButton(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          fit: FlexFit.tight,
                                          flex: 1,
                                          child: CircleAvatar(
                                            radius: 40,
                                            backgroundImage:
                                                NetworkImage(item.avatar),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                item.email,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey,
                                    height: 1,
                                    width: MediaQuery.of(context).size.width - 50,
                                  ),
                                ],
                              ),
                              onPressed: () async {
                                String url = 'mailto:' + item.email;
                                log(url);
                                if (await canLaunch(url)) {
                                  log('Yes');
                                  await launch(url);
                                } else {
                                  log('No');
                                  throw 'Could not launch $url';
                                }
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Loading...'),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: Ink(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: const Icon(Icons.person_add),
          color: Colors.black,
          onPressed: () => Navigator.pushNamed(context, '/Requests'),
        ),
      ),
    );
  }
}
