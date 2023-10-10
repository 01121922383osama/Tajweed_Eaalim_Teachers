import 'dart:async';

import 'package:flutter/material.dart';

import '../../App/app_routs.dart';
import '../../App/global.dart';
import '../../Customs/custom_lottie_image.dart';
import '../../constants/core/app_colors.dart';
import '../../constants/core/app_images.dart';
import '../../constants/core/app_names.dart';
import '../../constants/core/custtom_screen.dart';
import '../../constants/widgets/base_text.dart';
import '../../constants/widgets/navigator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        bool isLoged = Global.storageService.getIsLogIn();
        if (isLoged) {
          navigateScreenpushNamedAndRemoveUntil(context,
              page: AppRouts.homePage);
        } else {
          navigateScreenpushNamedAndRemoveUntil(context,
              page: AppRouts.welcomePage);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: CustomMediaQuery(context).screenWidth,
        height: CustomMediaQuery(context).screenHeight,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientLinearGradient,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customLottieImage(image: AppLottieImage.logofather),
            baseTextApp(text: AppNames.splashtitle),
            baseTextApp(text: AppNames.splashsubtitletitle),
          ],
        ),
      ),
    );
  }
}
