import 'package:eaalim_tajweed/Views/HamazahAlwasl/FaaAliasma/widgets/fee_alasmaa_widget.dart';
import 'package:eaalim_tajweed/Views/HamazahAlwasl/FeeAlhuruf/fee_alhuruf_screen.dart';
import 'package:eaalim_tajweed/Views/HamazahAlwasl/FeeAliafeal/fee_aliafeal_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';

class HamazahAlwaslPage extends StatefulWidget {
  const HamazahAlwaslPage({super.key});

  @override
  State<HamazahAlwaslPage> createState() => HamazahAlwaslPageState();
}

class HamazahAlwaslPageState extends State<HamazahAlwaslPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HamazahAlwasl'),
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
  'FaaAlhuruf',
  'FaaAliafeal',
  'FaaAliasma',
];

List<Widget> _pageNavigation = [
  const FeeAlhurufPage(),
  const FeeAliafealPage(),
  const FeeAliasmaPage(),
];
