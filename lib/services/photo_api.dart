// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// class PhotoApi {
//   static String baseUrl = "https://api.pexels.com/v1/curated";
//
//   Future<List<dynamic>> getPhotos() async {
//     final Response = await http.get(Uri.parse(baseUrl));
//
//     if (Response.statusCode == 200) {
//       return jsonDecode(Response.body);
//       headers: {
//        "Aut"
//       }
//     } else {
//       throw Exception("Data Not Found");
//     }
//   }
// }


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/pexels_key.dart';

class PhotoApi {
  static const String baseUrl =
      "https://api.pexels.com/v1/curated";

  Future<List<dynamic>> getPhotos() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": pexelsApiKey,
      },
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded["photos"];
    } else {
      throw Exception("Failed to load photos");
    }
  }
}
