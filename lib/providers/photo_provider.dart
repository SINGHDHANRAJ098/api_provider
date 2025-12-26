import 'package:flutter/foundation.dart';
import 'package:provider_ecom/Model/photo_model.dart';
import 'package:provider_ecom/services/photo_api.dart';

class PhotoProvider extends ChangeNotifier {
  final _api = PhotoApi();

  bool isLoading = false;
  List<PhotoModel> photos = [];

  Future<void> fetchPhotos() async {
    isLoading = true;
    notifyListeners();

    final data = await _api.getPhotos();

    photos = data.map<PhotoModel>((item) {
      return PhotoModel(
        id: item["id"],
        title: item["title"],
        url: item["url"],
        thumbnailUrl: item["thumbnailUrl"],
      );
    }).toList();

    isLoading = false;
    notifyListeners();
  }
}
