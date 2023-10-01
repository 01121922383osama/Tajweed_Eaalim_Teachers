import 'package:eaalim_tajweed/Views/Almodood/AlmaduAllaazim/AlharfiAlmukhafaf/alharfi_almukhafaf_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAllaazim/AlharfiuAlmuthqal/alharfiu_almuthqal_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAllaazim/AlkalamiuAlmathqal/alkalamiu_almathqal_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAllaazim/AlkalamiuAlmukhafaf/alkalamiu_almukhafaf_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants/core/app_images.dart';
import '../../../../constants/widgets/build_list_grid.dart';

class AlmaduAllaazim extends StatefulWidget {
  const AlmaduAllaazim({super.key});

  @override
  State<AlmaduAllaazim> createState() => _AlmaduAllaazimState();
}

class _AlmaduAllaazimState extends State<AlmaduAllaazim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Almodood'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
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
  'AlharfiAlmukhafaf',
  'AlharfiuAlmuthqal',
  'AlkalamiuAlmathqal',
  'AlkalamiuAlmukhafaf',
];

List<Widget> _pageNavigation = [
  const AlharfiAlmukhafafPage(),
  const AlharfiuAlmuthqalPage(),
  const AlkalamiuAlmathqalPage(),
  const AlkalamiuAlmukhafafPage(),
];
