import 'package:flutter/material.dart';

import 'package:mentor_volunteers/api/short_term_data.dart';
import 'package:mentor_volunteers/widgets/answer_input_dialog.dart';
import 'package:mentor_volunteers/widgets/navigation_appbar.dart';
import 'package:mentor_volunteers/screens/question_expansion.dart';

class ShortTerm extends StatelessWidget {
  ShortTerm({Key? key}) : super(key: key);

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavAppBar(),
      body: FutureBuilder<List<Question>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Center(
                child: PageView(
                  controller: controller,
                  children: snapshot.data!
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 22,
                              ),
                              Text(
                                item.date,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Colors.black,
                                        ],
                                        begin: FractionalOffset(1.0, 0.0),
                                        end: FractionalOffset(1.0, 1.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      item.content,
                                      maxLines: 18,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: IconButton(
                                  icon: const Icon(Icons.expand_more),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              QuestionExpansion(question: item),
                                        ));
                                  },
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Text(
                                item.title,
                                style: const TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                height: 52,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
                                      },
                                      child: const Text('Skip'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        displayTextInputDialog(context, item);
                                      },
                                      child: const Text('Answer'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
    );
  }
}
