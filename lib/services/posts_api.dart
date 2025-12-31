import 'dart:convert';


import 'package:provider_ecom/Model/post_model.dart';
import 'package:http/http.dart'as http;

Future<List<PostModel>> fatchMoadel() async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  final List data = jsonDecode(response.body);
  return data.map((e) => PostModel.formJson(e)).toList();
}