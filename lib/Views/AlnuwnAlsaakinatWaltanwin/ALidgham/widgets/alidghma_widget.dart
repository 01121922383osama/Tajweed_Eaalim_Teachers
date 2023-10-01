import 'package:eaalim_tajweed/Views/AlnuwnAlsaakinatWaltanwin/ALidgham/AlidghamBeghnah/aLidgham_bighina_screen.dart';
import 'package:eaalim_tajweed/Views/AlnuwnAlsaakinatWaltanwin/ALidgham/AlidghamBelaGhonah/aLidgham_bilaghunah_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants/core/app_images.dart';
import '../../../../constants/widgets/build_list_grid.dart';

class ALidghamPage extends StatefulWidget {
  const ALidghamPage({super.key});

  @override
  State<ALidghamPage> createState() => AlnuwnAlsaakinatWaltanwintate();
}

class AlnuwnAlsaakinatWaltanwintate extends State<ALidghamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALidgham'),
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
  'ALidghamBighina',
  'ALidghamBilaghuna',
];

List<Widget> _pageNavigation = [
  const ALidghamBighinaPage(),
  const ALidghamBilaghunaPage(),
];
