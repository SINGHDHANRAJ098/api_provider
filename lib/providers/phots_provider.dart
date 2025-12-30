import 'package:flutter/material.dart';
import 'package:provider_ecom/Model/photos_model.dart';
import 'package:provider_ecom/services/photo_api.dart';

import '../services/photos_api.dart';

class PhotosProvider extends ChangeNotifier {
  final _api = PhotosApi();

  bool isLoading = false;
  String? errorMessage;
  List<PhotosModel> photos = [];

  Future<void> fetchPhotos() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      photos = await _api.getPhotos();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
