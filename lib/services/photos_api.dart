import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_ecom/Model/photos_model.dart';

class PhotosApi {
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<PhotosModel>> getPhotos() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);

      return data
          .map((json) => PhotosModel.fromJson(json))
          .toList()
          .cast<PhotosModel>();
    }

    throw Exception("Failed to load data");
  }
}


