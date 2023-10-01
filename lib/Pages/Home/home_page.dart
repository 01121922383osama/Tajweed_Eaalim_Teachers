import '../../constants/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Customs/customs_drawer.dart';
import '../../constants/core/app_names.dart';
import 'widgets/home_page_widgete.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppNames.titleEaalim),
        centerTitle: true,
      ),
      drawer: const CusttomDrawer(),
      body: const CusttomBodyHomePage(),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: AppColors.textSecondary,
        onPressed: openWhatsApp,
        child: FaIcon(
          FontAwesomeIcons.whatsapp,
          color: AppColors.green,
        ),
      ),
    );
  }
}

Future<void> openWhatsApp() async {
  String phone = '+201118568111';
  String message = 'Hello Eaalim';
  var url = 'https://wa.me/$phone?text=$message';
  await launchUrl(Uri.parse(url));
  // await canLaunchUrl(Uri.parse(url));
}
