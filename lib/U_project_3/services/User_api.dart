import 'package:http_tute/U_project_3/models.dart';
import 'package:http/http.dart' as http;
import 'package:http_tute/U_project_3/username.dart';
import 'dart:convert';

class UserApi{
static Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=100'));
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        phone: e['phone'],
        nat: e['nat'],
        name: name,
      );
    }).toList();
    return users;
  
  }
}