import 'dart:convert';

import 'package:http/http.dart' as http;

class Mentor {
  final int id, category;
  final String name, avatar, bio;

  Mentor(this.id, this.name, this.avatar, this.bio, this.category);
}

// Data fetching function for mentor category
Future<List<Mentor>> getMentor(int category) async {
  var response = await http
      .get(Uri.https('61fd894fa58a4e00173c95b8.mockapi.io', 'mentors'));
  var jsonData = jsonDecode(response.body);

  List<Mentor> mentors = [];

  for (var men in jsonData) {
    Mentor mentor = Mentor(
        men['id'], men['name'], men['avatar'], men['bio'], men['category']);

    if (mentor.category == category) {
      mentors.add(mentor);
    }
  }

  return mentors;
}
