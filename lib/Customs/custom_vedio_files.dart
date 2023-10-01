import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPage extends StatelessWidget {
  final String? videoUrl;
  const CustomVideoPage({Key? key, this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return FutureBuilder<VideoPlayerController?>(
          future: _initializeVideoPlayer(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final videoPlayerController = snapshot.data;
              if (videoPlayerController != null) {
                final chewieController = ChewieController(
                  videoPlayerController: videoPlayerController,
                );
                return Chewie(controller: chewieController);
              } else {
                return const Center(
                    child: Text(
                        "Error: Video initialization failed, Please restart your application"));
              }
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  Future<VideoPlayerController?> _initializeVideoPlayer() async {
    try {
      final file = await DefaultCacheManager().getSingleFile(
        videoUrl!,
      );
      final videoPlayerController = VideoPlayerController.file(File(file.path));
      await videoPlayerController.initialize();
      return videoPlayerController;
    } catch (e) {
      AlertDialog(
        title: const Text('Error Downloading'),
        content: Text(e.toString()),
      );
      return null;
    }
  }
}
