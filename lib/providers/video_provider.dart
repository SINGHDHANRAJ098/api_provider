import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';
import '../Model/video_model.dart';

import '../services/video_api.dart';

class VideoProvider extends ChangeNotifier {
  final _api = VideoApi();

  bool isLoading = false;
  VideoPlayerController? controller;
  VideoModel? video;

  Future<void> loadvideo() async {
    isLoading = true;
    notifyListeners();

    final item = await _api.fetchvideo();
    final files = item["video_files"];
    final file = files.firstWhere(
      (f) => f["quality"] == "hd",
      orElse: () => files.first,
    );

    video = VideoModel(id: item["id"], url: file["link"]);

    controller?.dispose();

    controller =VideoPlayerController.network(video!.url);
    await controller!.initialize();
    controller!.play();

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}



