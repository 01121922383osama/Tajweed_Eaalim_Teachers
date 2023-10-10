import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../App/app_routs.dart';
import '../constants/core/app_colors.dart';
import '../constants/core/app_images.dart';
import '../constants/core/app_names.dart';
import '../constants/core/custtom_screen.dart';
import '../constants/widgets/base_text.dart';
import '../constants/widgets/build_list_tile.dart';
import '../constants/widgets/navigator.dart';
import 'custom_lottie_image.dart';

class CusttomDrawer extends StatelessWidget {
  const CusttomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary300,
      elevation: 0,
      child: ListView(
        children: [
          SizedBox(
            height: CustomMediaQuery(context).screenWidth / 2.5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 50,
                    child: customImage(context, image: AppImages.imageCircle),
                  ),
                ),
                baseTextApp(text: AppNames.titleEaalim),
              ],
            ),
          ),
          const Divider(thickness: 1),
          buildListTile(
            context,
            title: AppNames.download,
            onTap: () {
              navigateScreenpushNamed(context, page: AppRouts.download);
            },
            iconData: FontAwesomeIcons.download,
          ),
          buildListTile(
            context,
            title: AppNames.pdf,
            onTap: () {
              navigateScreenpushNamed(context, page: AppRouts.pdf);
            },
            iconData: FontAwesomeIcons.filePdf,
          ),
          buildListTile(
            context,
            title: AppNames.azkar,
            onTap: () {},
            iconData: FontAwesomeIcons.handHoldingMedical,
          ),
          buildListTile(
            context,
            title: AppNames.sebha,
            onTap: () {
              navigateScreenpushNamed(context, page: AppRouts.seb7a);
            },
            iconData: FontAwesomeIcons.bookQuran,
          ),
          buildListTile(
            context,
            title: AppNames.feedback,
            onTap: () {
              navigateScreenpushNamed(context, page: AppRouts.feadback);
            },
            iconData: FontAwesomeIcons.feather,
          ),
          buildListTile(
            context,
            title: AppNames.rate,
            onTap: () {},
            iconData: FontAwesomeIcons.star,
          ),
        ],
      ),
    );
  }
}
