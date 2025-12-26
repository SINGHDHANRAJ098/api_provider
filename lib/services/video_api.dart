import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config/pexels_key.dart';

class VideoApi {

  Future<Map<String,dynamic>>fetchvideo() async{
    const url ="https://api.pexels.com/videos/search?query=nature&per_page=1";
    final response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": pexelsApiKey},
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to fetch video");
    }

    final json = jsonDecode(response.body);
    return json["videos"][0];
  }
}



