import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoPlayerController? videoPlayerController;
  VideoCubit({this.videoPlayerController}) : super(VideoInitial());

  void initializePlayer() async {
    try {
      await videoPlayerController?.initialize();
      emit(VideoReady(videoPlayerController!));
    } catch (e) {
      emit(VideoError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    videoPlayerController?.dispose();
    return super.close();
  }
}
