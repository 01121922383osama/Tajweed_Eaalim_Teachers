import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Customs/customs_drawer.dart';
import '../../constants/core/app_colors.dart';
import '../../constants/core/app_names.dart';
import 'widgets/home_page_widgete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppNames.titleEaalim),
        centerTitle: true,
      ),
      drawer: const CusttomDrawer(),
      body: AnimatedBuilder(
        animation: animationController,
        child: const CusttomBodyHomePage(),
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, -6),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
                parent: animationController, curve: Curves.bounceIn)),
            child: child,
          );
        },
      ),
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
