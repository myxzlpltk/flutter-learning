import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<List<User>> getUsers(String page) async {
    String apiURL = "https://reqres.in/api/users?page=" + page;

    var response = await http.get(apiURL);
    var JSON = json.decode(response.body);
    List<dynamic> data = (JSON as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < data.length; i++) {
      users.add(User.createUser(data[i]));
    }

    return users;
  }
}
