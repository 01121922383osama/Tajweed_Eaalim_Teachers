import 'package:eaalim_tajweed/Views/AlmimAlsaakinah/AlekhafaaAlshafway/al_ekhfaa_alshafwy_screen.dart';
import 'package:eaalim_tajweed/Views/AlmimAlsaakinah/AzharShafaween/azhar_shafwy_screen.dart';
import 'package:eaalim_tajweed/Views/AlmimAlsaakinah/IdghamAlmithlayn/idgham_almathleen_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';

class AlmimAlsaakinahPage extends StatefulWidget {
  const AlmimAlsaakinahPage({super.key});

  @override
  State<AlmimAlsaakinahPage> createState() => _AlmimAlsaakinahPageState();
}

class _AlmimAlsaakinahPageState extends State<AlmimAlsaakinahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alraaalmufakhamuh'),
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
  'AlekhafaaAlshafway',
  'AzharShafaween',
  'IdghamAlmithlayn',
];

List<Widget> _pageNavigation = [
  const AlEkhfaaAlshafwyPage(),
  const AlEzharAlshweenPage(),
  const IdghamAlmathleenPage(),
];
