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
