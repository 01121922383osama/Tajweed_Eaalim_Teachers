import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../constants/widgets/shimmer_widget.dart';

class CustomAudiosFiles extends StatefulWidget {
  final String? firstbucket;
  final String? secondbucket;

  const CustomAudiosFiles({super.key, this.firstbucket, this.secondbucket});

  @override
  State<CustomAudiosFiles> createState() => _CustomAudiosFilesState();
}

class _CustomAudiosFilesState extends State<CustomAudiosFiles> {
  final storage = FirebaseStorage.instance;
  List<String> audioFiles = [];
  final AudioPlayer player = AudioPlayer();
  bool isLoading = false;
  int currentPage = 0;
  String? currentAudioFile;
  final int pageLimit = 20;
  bool isPlaying = false;
  bool isAudioPlaying = false;
  bool isAudioStartingToPlay = false;
  bool shouldPlayAudio = false;
  Future<void> downloadFiles() async {
    try {
      setState(() {
        isLoading = true;
      });
      final ListResult result = await storage
          .ref()
          .child('${widget.firstbucket}/')
          .child('${widget.secondbucket}/')
          .listAll();
      final List<String> files = result.items.map((e) => e.name).toList();

      if (mounted) {
        setState(() {
          audioFiles = files;
        });
      }
    } on FirebaseException catch (e) {
      Future.delayed(
        Duration.zero,
        () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Firebase Error: ${e.message}'),
            );
          },
        ),
      );
    } catch (e) {
      Future.delayed(
        Duration.zero,
        () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('An error occurred: $e'),
            );
          },
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    player.automaticallyWaitsToMinimizeStalling;
    downloadFiles();
  }

  String getEnglishName(String filename) {
    final parts = filename.split("/");
    if (parts.length > 1) {
      return parts[1].trim().replaceAll('.mp3', '');
    }
    return filename.replaceAll('.mp3', '');
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playOrPauseAudio(String filename) async {
    if (isAudioStartingToPlay) {
      // If audio is starting to play, do nothing.
      return;
    }

    if (isPlaying) {
      pauseAudio();
    } else {
      shouldPlayAudio =
          true; // Set the flag to indicate that audio should play.
      playAudio(filename);
    }
  }

  void playAudio(String filename) async {
    if (await _checkInternetConnection()) {
      final url = await storage
          .ref('${widget.firstbucket}/${widget.secondbucket}/$filename')
          .getDownloadURL();
      await player.setUrl(url);
      player.play();
      setState(() {
        isPlaying = true;
        isAudioPlaying = true;
        currentAudioFile = filename;
      });

      player.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          pauseAudio();
        }
      });
    } else {
      Future.delayed(
        Duration.zero,
        () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You need an internet connection to play audio.'),
          ),
        ),
      );
    }
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  void pauseAudio() {
    player.pause();
    setState(() {
      isPlaying = false;
      isAudioPlaying = false;
      shouldPlayAudio = false; // Reset the flag when audio is paused.
    });
  }

  void resumeAudio() {
    player.play();
    setState(() {
      isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final endIndex = (currentPage + 1) * pageLimit;
    final displayedAudioFiles = audioFiles.sublist(
      0,
      endIndex > audioFiles.length ? audioFiles.length : endIndex,
    );
    return Column(
      children: [
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                loadMoreItems();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: displayedAudioFiles.length,
              itemBuilder: (BuildContext context, int index) {
                final filename = displayedAudioFiles[index];
                return Column(
                  children: [
                    Card(
                      elevation: 25,
                      child: ListTile(
                        leading: Text('${index + 1}'),
                        title: Text(getEnglishName(filename)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 0.5,
                                      blurRadius: 3,
                                      offset: Offset(0.5, 0.5),
                                    ),
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.5, 0),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: displayedAudioFiles[index] ==
                                              currentAudioFile &&
                                          isPlaying
                                      ? const Icon(Icons.pause)
                                      : const Icon(Icons.play_arrow),
                                  onPressed: () {
                                    if (displayedAudioFiles[index] ==
                                            currentAudioFile &&
                                        isPlaying) {
                                      pauseAudio();
                                    } else {
                                      playOrPauseAudio(
                                          displayedAudioFiles[index]);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        if (isLoading && currentPage < endIndex) buildShimmer(),
      ],
    );
  }

  void loadMoreItems() {
    setState(() {
      currentPage++;
    });
    downloadFiles();
  }
}

Widget buildShimmer() {
  return const ListTile(
    trailing: ShimmerWidget.circular(width: 35, height: 35),
    title: ShimmerWidget.rectangle(height: 15),
    subtitle: ShimmerWidget.rectangle(height: 10),
  );
}
