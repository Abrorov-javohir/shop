import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop1/models/users.dart';

class UserService {
  static const String apiUrl = 'https://api.escuelajs.co/api/v1/users';

  Future<List<Users>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => Users.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
