part of 'video_cubit.dart';

@immutable
sealed class VideoState {}

final class VideoInitial extends VideoState {}

class VideoReady extends VideoState {
  final VideoPlayerController controller;
  VideoReady(this.controller);
}

class VideoError extends VideoState {
  final String message;
  VideoError(this.message);
}
