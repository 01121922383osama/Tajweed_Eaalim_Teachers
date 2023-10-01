import 'package:eaalim_tajweed/Views/Almodood/AlmaduAlbadal/almadu_albadal_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAlearidLilsukun/almadu_alearid_alilsaken-screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAleawad/almadu_aleawad_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAljayizAlmunfasil/almadu_aljayiz_almunfasil_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAllaazim/widgets/al_mado_allazem_widget.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAlliyn/almadu_alliyn_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAlmunfasil/almadu_almunfasil_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAlsiluhAlkubraa/almadu_alsiluh_alkubraa_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAltabieaa/almadu_altabieaa_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduAlwajibAlmutasil/almadu_alwajib_almutasil_screen.dart';
import 'package:eaalim_tajweed/Views/Almodood/AlmaduSIlahSughraa/almadu_silah_sughraa_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';

class AlmodoodPage extends StatefulWidget {
  const AlmodoodPage({super.key});

  @override
  State<AlmodoodPage> createState() => _AlmodoodPageState();
}

class _AlmodoodPageState extends State<AlmodoodPage> {
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
  'AlmaduAlbadal',
  'AlmaduAlearidLilsukun',
  'AlmaduAleawad',
  'AlmaduAljayizAlmunfasil',
  'AlmaduAllaazim',
  'AlmaduAlliyn',
  'AlmaduAlmunfasil',
  'AlmaduAlsiluhAlkubraa',
  'AlmaduAltabieaa',
  'AlmaduAlwajibAlmutasil',
  'AlmaduSIlahSughraa',
];

List<Widget> _pageNavigation = [
  const AlmaduAlbadalPage(),
  const AlmaduAlearidLilsukunPage(),
  const AlmaduAleawadPage(),
  const AlmaduAljayizAlmunfasilPage(),
  const AlmaduAllaazim(),
  const AlmaduAlliynPage(),
  const AlmaduAlmunfasilPage(),
  const AlmaduAlsiluhAlkubraaPage(),
  const AlmaduAltabieaaPage(),
  const AlmaduAlwajibAlmutasilPage(),
  const AlmaduSIlahSughraaPage(),
];
