import 'package:flutter/material.dart';

import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';
import '../AlekhafaaAlshafway/al_ekhfaa_alshafwy_screen.dart';
import '../AzharShafaween/azhar_shafwy_screen.dart';
import '../IdghamAlmithlayn/idgham_almathleen_screen.dart';

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
        title: const Text('الميم الساكنه'),
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
  'الإخفاء الشفوي',
  'الإظهار الشفوي',
  'إضغام المثلين',
];

List<Widget> _pageNavigation = [
  const AlEkhfaaAlshafwyPage(),
  const AlEzharAlshweenPage(),
  const IdghamAlmathleenPage(),
];
