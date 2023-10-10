import 'package:flutter/material.dart';

import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';
import '../Alraaalmufakhamuh/alraa_almufakhamuh.dart';
import '../Alraaalmuraqaqa/raa_almurqaqa_screen.dart';
import '../Rayajuzfihaalwajhan/raa_yjooz_fiha_alwghan_screen.dart';

class AlraaalmufakhamuhPage extends StatefulWidget {
  const AlraaalmufakhamuhPage({super.key});

  @override
  State<AlraaalmufakhamuhPage> createState() => _AlraaalmufakhamuhPageState();
}

class _AlraaalmufakhamuhPageState extends State<AlraaalmufakhamuhPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الراء'),
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
  'الراء المفخمه',
  'الراء المرققه',
  'راء يجوز فيها الوجهان',
];

List<Widget> _pageNavigation = [
  const Alraaalmufakhamuh(),
  const AlraaalmuraqaqaPage(),
  const RayajuzfihaalwajhanPage(),
];
