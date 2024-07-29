import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ECommerceHelper{


  Future<Map> fetchData()
  async {
    String api = "https://dummyjson.com/products";
    Uri url =Uri.parse(api);
    Response response = await http.get(url);

    if(response.statusCode == 200)
      {
        final json = response.body;
        Map data = jsonDecode(json);
        return data;
      }
    else {
      return {};
    }

  }
}