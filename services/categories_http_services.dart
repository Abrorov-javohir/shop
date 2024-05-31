import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop1/models/categoriees.dart';

class CategoriesService {
  static const String apiUrl = 'https://api.escuelajs.co/api/v1/categories';

  Future<List<Categories>> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((category) => Categories.fromJson(category))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
