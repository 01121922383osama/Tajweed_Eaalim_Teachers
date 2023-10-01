import 'package:eaalim_tajweed/Views/HamazahAlwasl/FaaAliasma/Madmumuh/madmumuh_screen.dart';
import 'package:eaalim_tajweed/Views/HamazahAlwasl/FaaAliasma/Maksuruh/maksurah_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants/core/app_images.dart';
import '../../../../constants/widgets/build_list_grid.dart';

class FeeAliasmaPage extends StatefulWidget {
  const FeeAliasmaPage({super.key});

  @override
  State<FeeAliasmaPage> createState() => FeeAliasmaPageState();
}

class FeeAliasmaPageState extends State<FeeAliasmaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeeAlasmaa'),
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
  'Madmumuh',
  'Maksuruh',
];

List<Widget> _pageNavigation = [
  const MadmumuhPage(),
  const MaksuruhPage(),
];
