import 'package:eaalim_tajweed/Views/AlmadAlsilahAlkubraa/almad_alsilah_alkubraa_screen.dart';
import 'package:eaalim_tajweed/Views/AlnuwnAlmushadaduh/alnuwn_almushadaduh_screen.dart';
import 'package:eaalim_tajweed/Views/Alqalqaluh/alqalqaluh_screen.dart';
import 'package:eaalim_tajweed/Views/AlqalqaluhAlkubraa/alqalqaluh_alkubraa_screen.dart';
import 'package:eaalim_tajweed/Views/Altafkhim/altafkhim_screen.dart';
import 'package:eaalim_tajweed/Views/Altarqiq/altarqiq_screen.dart';
import 'package:eaalim_tajweed/Views/ELtqaaalsaakinin/eltqaa_alsaakinin_screen.dart';
import 'package:eaalim_tajweed/Views/HamazahAlwasl/widgets/hamza_alwasl_widget.dart';
import 'package:eaalim_tajweed/Views/QalqalaSoghra/qalqala_soghra_screen.dart';
import 'package:flutter/material.dart';

import '../../../Views/AlLamat/widgets/al_laamat_alqamaria.dart';
import '../../../Views/Alghanah/alghonah_screen.dart';
import '../../../Views/Alhams/alhams_screen.dart';
import '../../../Views/Alhurufallathawia/alhuruf_allathawia_screen.dart';
import '../../../Views/Almadualjayizalmunfasil/almadu_aljayiz_almunfasil_screen.dart';
import '../../../Views/AlmimAlmushadaduh/almim_almushadaduh_screen.dart';
import '../../../Views/AlmimAlsaakinah/widgets/al_mim_sakinah_widget.dart';
import '../../../Views/Almodood/widgets/almodood_widget_screen.dart';
import '../../../Views/AlnuwnAlsaakinatWaltanwin/widgets/alnuwn_alsaakinat_waltanwin_widget.dart';
import '../../../Views/Alraa/widgets/al_raa_almufakhamuh.dart';
import '../../../Views/adgham%20almutajanisin/adgham_mutjanisin_screen.dart';
import '../../../constants/widgets/build_list_grid.dart';

class CusttomBodyHomePage extends StatelessWidget {
  const CusttomBodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: page.length,
            itemBuilder: (context, index) {
              return buildListGridView(
                context,
                text: page[index],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => pageNavigation[index],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

List<String> page = [
  'Allaamat',
  'Alraa',
  'Alghanah',
  'Alhams',
  'Alhurufallathawia',
  'adgham almutajanisin',
  'Almadualjayizalmunfasil',
  //
  'AlmimAlmushadaduh',
  'AlmimAlsaakinah',
  'Almodood',
  'AlmadAlsilahAlkubraa',
  'AlnuwnAlmushadaduh',
  'AlnuwnAlsaakinatWaltanwin',
  'Altafkhim',
  'Alqalqaluh',
  'AlqalqaluhAlkubraa',
  'Altarqiq',
  'ELtqaaalsaakinin',
  'HamazahAlwasl',
  'QalqalaSoghra',
];

List<Widget> pageNavigation = [
  const AllaamatalqamariaPage(),
  const AlraaalmufakhamuhPage(),
  const AlghonahPage(),
  const AlhamsPage(),
  const AlhurufallathawiaPage(),
  const AdghamalmutajanisinPage(),
  const AlmadualjayizalmunfasilPage(),
  //
  const AlmimAlmushadaduhPage(),
  const AlmimAlsaakinahPage(),
  const AlmodoodPage(),
  const AlmadAlsilahAlkubraaPage(),
  const AlnuwnAlmushadaduhPage(),
  const AlnuwnAlsaakinatWaltanwinPage(),
  const AltafkhimPage(),
  const AlqalqaluhPage(),
  const AlqalqaluhAlkubraaPage(),
  const AltarqiqPage(),
  const ELtqaaalsaakininPage(),
  const HamazahAlwaslPage(),
  const QalqalaSoghraPage(),
];
