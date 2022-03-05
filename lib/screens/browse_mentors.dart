import 'package:flutter/material.dart';

import 'package:mentor_volunteers/api/mentor_data.dart';
import 'package:mentor_volunteers/widgets/navigation_appbar.dart';
import 'package:mentor_volunteers/widgets/slider_menu.dart';

class BrowseMentor extends StatelessWidget {
  final int category;

  BrowseMentor({Key? key, required this.category}) : super(key: key);

  final controller = PageController(initialPage: 0);
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
      body: FutureBuilder<List<Mentor>>(
        future: getMentor(category),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView(
              controller: controller,
              children: snapshot.data!
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                'VOLUNTEER',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 3,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: CircleAvatar(
                              radius: 110,
                              backgroundImage: NetworkImage(item.avatar),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Text(
                              item.bio,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(
                                    width: 2,
                                  ),
                                ),
                                TextButton(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'SKIP',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '\u{2192}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 46,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.ease);
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
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
