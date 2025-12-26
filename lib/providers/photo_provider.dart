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
      final src = item['src'];
      return PhotoModel(
        id: item["id"],
        title: item["alt"],
        url: src["large"],
        thumbnailUrl: src["small"],
      );
    }).toList();

    isLoading = false;
    notifyListeners();
  }
}

