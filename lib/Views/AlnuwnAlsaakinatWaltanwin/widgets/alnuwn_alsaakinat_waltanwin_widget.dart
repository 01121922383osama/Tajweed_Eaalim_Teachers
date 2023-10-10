import 'package:flutter/material.dart';

import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';
import '../ALeqlab/aleqlab_screen.dart';
import '../ALidgham/widgets/alidghma_widget.dart';
import '../ALiikhfa/aliikhfa_screen.dart';
import '../Alaizihar/alaizihar_screen.dart';

class AlnuwnAlsaakinatWaltanwinPage extends StatefulWidget {
  const AlnuwnAlsaakinatWaltanwinPage({super.key});

  @override
  State<AlnuwnAlsaakinatWaltanwinPage> createState() =>
      AlnuwnAlsaakinatWaltanwintate();
}

class AlnuwnAlsaakinatWaltanwintate
    extends State<AlnuwnAlsaakinatWaltanwinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النون الساكنه والتنوين'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return buildListGridView(
                  context,
                  text: _pages[index],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => _pageNavigation[index],
                      ),
                    );
                  },
                  image: AppImages.imageCircle,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<String> _pages = [
  'الإقلاب',
  'الإدغام',
  'الإخفاء',
  'الإظهار',
];

List<Widget> _pageNavigation = [
  const ALeqlabPage(),
  const ALidghamPage(),
  const ALiikhfaPage(),
  const AlaiziharPage(),
];
