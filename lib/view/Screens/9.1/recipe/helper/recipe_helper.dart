import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeHelper {
  Future<Map> fetchApiData() async {
    String api = "https://dummyjson.com/recipes";
    Uri url = Uri.parse(api);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = response.body;
        return jsonDecode(json);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching API data: $e');
      return {};
    }
  }
}
