import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ecom/providers/video_provider.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Video player ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<VideoProvider>().loadvideo(),
        child: Icon(Icons.download_for_offline_outlined),
      ),
      body: Consumer<VideoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.controller == null) {
            return Center(child: Text("tap to load the video"));
          }
          return Center(
            child: AspectRatio(
              aspectRatio: provider.controller!.value.aspectRatio,
              child: VideoPlayer(provider.controller!),
            ),
          );
        },
      ),
    );
  }
}
