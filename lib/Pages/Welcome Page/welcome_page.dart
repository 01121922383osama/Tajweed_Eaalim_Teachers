import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../App/app_routs.dart';
import '../../App/global.dart';
import '../../constants/core/app_colors.dart';
import '../../constants/core/app_images.dart';
import '../../constants/core/custtom_screen.dart';
import '../../constants/values/app_constant.dart';
import '../../constants/widgets/base_text.dart';
import '../../constants/widgets/navigator.dart';
import '../../controller/Welcome Bloc/welcome_cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeCubit, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.only(top: 34),
              width: CustomMediaQuery(context).screenWidth,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      state.index;
                      BlocProvider.of<WelcomeCubit>(context)
                          .updateWelcomeState(value);
                    },
                    children: [
                      _page(
                        context,
                        index: 1,
                        imagePath: AppImages.ka3ba,
                        title: 'First see Learning',
                        subStitle:
                            'Forget about a for of paper all knowledge in one learning',
                        buttonName: 'Next',
                      ),
                      _page(
                        context,
                        index: 2,
                        imagePath: AppImages.ka3ba,
                        title: 'Connect with Everyone',
                        subStitle:
                            'Always keep in touch with your tutor & friend let`s get connected!',
                        buttonName: 'Next',
                      ),
                      _page(
                        context,
                        index: 3,
                        imagePath: AppImages.ka3ba,
                        title: 'Always Fascinated Learning',
                        subStitle:
                            'Anywhere, anytime. The time is at your discretion so study whenever you want',
                        buttonName: 'Get Started',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: CustomMediaQuery(context).screenHeight / 15,
                    child: DotsIndicator(
                      position: state.index.toDouble(),
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.textPrimary,
                        activeColor: AppColors.accent100,
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(BuildContext context,
      {int? index,
      String? imagePath,
      String? title,
      String? subStitle,
      String? buttonName}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            // width: CustomMediaQuery(context).screenWidth / 3,
            height: CustomMediaQuery(context).screenHeight / 2.5,
            child: Image.asset(
              imagePath!,
              fit: BoxFit.cover,
            ),
          ),
          baseTextApp(text: title!),
          Container(
            width: CustomMediaQuery(context).screenWidth,
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: baseTextApp(
                text: subStitle!, fontSize: 15, color: AppColors.textSecondary),
          ),
          GestureDetector(
            onTap: () {
              if (index! < 3) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                );
              } else {
                Global.storageService
                    .setString(
                        AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, '123456')
                    .then((value) {
                  navigateScreenpushNamedAndRemoveUntil(context,
                      page: AppRouts.homePage);
                });
              }
            },
            child: Container(
              // width: CustomMediaQuery(context).screenWidth / 1,
              height: CustomMediaQuery(context).screenHeight / 15,
              margin: EdgeInsets.only(
                top: CustomMediaQuery(context).screenHeight / 8,
                left: CustomMediaQuery(context).screenWidth / 15,
                right: CustomMediaQuery(context).screenWidth / 15,
              ),
              decoration: const BoxDecoration(
                color: AppColors.accent100,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.textPrimary,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: baseTextApp(
                  text: buttonName!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
