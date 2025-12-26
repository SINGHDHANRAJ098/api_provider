 import 'dart:convert';

import 'package:http/http.dart' as http;
class PhotoApi {
  static String baseUrl = "https://jsonplaceholder.typicode.com/photos";

  Future<List<dynamic>> getPhotos() async {
    final Response = await http.get(Uri.parse(baseUrl));
    
    if(Response.statusCode ==200){
   return jsonDecode(Response.body);
    } else{
      throw Exception("Data Not Found");
    }

  }

 }