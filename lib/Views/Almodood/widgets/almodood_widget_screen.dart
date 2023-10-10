import 'package:flutter/material.dart';

import '../../../constants/core/app_images.dart';
import '../../../constants/widgets/build_list_grid.dart';
import '../AlmaduAlbadal/almadu_albadal_screen.dart';
import '../AlmaduAlearidLilsukun/almadu_alearid_alilsaken_screen.dart';
import '../AlmaduAleawad/almadu_aleawad_screen.dart';
import '../AlmaduAljayizAlmunfasil/almadu_aljayiz_almunfasil_screen.dart';
import '../AlmaduAllaazim/widgets/al_mado_allazem_widget.dart';
import '../AlmaduAlliyn/almadu_alliyn_screen.dart';
import '../AlmaduAlmunfasil/almadu_almunfasil_screen.dart';
import '../AlmaduAlsiluhAlkubraa/almadu_alsiluh_alkubraa_screen.dart';
import '../AlmaduAltabieaa/almadu_altabieaa_screen.dart';
import '../AlmaduAlwajibAlmutasil/almadu_alwajib_almutasil_screen.dart';
import '../AlmaduSIlahSughraa/almadu_silah_sughraa_screen.dart';

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
        title: const Text('المدود'),
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
  'المد البدل',
  'المد العارض للسكون',
  'المد العوض',
  'المد الجائز المنفصل',
  'المد اللازم',
  'المد اللين',
  'المد المنفصل',
  'المد الصله الكبري',
  'المد الطبيعي',
  'المد الواجب المتصل',
  'المد الصله الصغري',
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
