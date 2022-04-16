import 'dart:convert';

import 'package:http/http.dart' as http;

class Request {
  final int id;
  final String name, email, createdAt, body, avatar;

  Request(this.id, this.name, this.email, this.createdAt, this.body, this.avatar);
}

Future<List<Request>> getRequests() async {
  var response = await http
      .get(Uri.https('61fd894fa58a4e00173c95b8.mockapi.io', 'requests'));
  var jsonData = jsonDecode(response.body);

  List<Request> requests = [];

  for (var req in jsonData) {
    Request request = Request(req['id'], req['name'], req['email'], req['createdAt'], req['body'], req['avatar']);
    requests.add(request);
  }

  return requests;
}