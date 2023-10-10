import 'package:flutter/material.dart';

import '../../Customs/custom_audio_files.dart';
import '../../Customs/custom_vedio_files.dart';
import '../../constants/core/custtom_screen.dart';

class AlhurufallathawiaPage extends StatelessWidget {
  const AlhurufallathawiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الحروف اللثويه'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: CustomMediaQuery(context).screenWidth,
            height: CustomMediaQuery(context).screenHeight / 4,
            child: const CustomVideoPage(
              videoUrl:
                  'https://firebasestorage.googleapis.com/v0/b/eaalim-tajweed.appspot.com/o/video%2F3384b3ad24af6aa6dd908d59111ecb29.mp4?alt=media&token=204c0c9b-8d59-4098-9a58-46d42ee42649',
            ),
          ),
          const Expanded(
            child: CustomAudiosFiles(
              firstbucket: 'Alhurufallathawia',
              secondbucket: 'Alhurufallathawia',
            ),
          ),
        ],
      ),
    );
  }
}
