import 'dart:convert';

import 'package:http/http.dart' as http;

class Answer {
  final int id;
  final String name, date, content;

  Answer(this.id, this.name, this.date, this.content);
}

class Question {
  final int id;
  final String name, date, title, content;
  List<Answer> answers = [];

  Question(this.id, this.name, this.date, this.title, this.content);
}

// Data fetching function for short term mentorship
Future<List<Question>> getData() async {
  // temporary url for fetching data
  var response = await http
      .get(Uri.https('61fd894fa58a4e00173c95b8.mockapi.io', 'shortterm'));
  var jsonData = jsonDecode(response.body);

  List<Question> questions = [];

  for (var ques in jsonData) {
    Question question = Question(
        ques['id'], ques['name'], ques['date'], ques['title'], ques['content']);
    for (var ans in ques['answers']) {
      Answer answer =
          Answer(ans['id'], ans['name'], ans['date'], ans['content']);
      question.answers.add(answer);
    }
    questions.add(question);
  }

  return questions;
}
