import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Pages/Bearish/bearish_page.dart';
import '../Pages/Download/download_page.dart';
import '../Pages/FeadBack/fead_back_page.dart';
import '../Pages/Home/home_page.dart';
import '../Pages/Pdf/pdf_page.dart';
import '../Pages/Splash%20Page/splash_page.dart';
import '../Pages/Welcome%20Page/welcome_page.dart';
import '../constants/core/app_colors.dart';
import '../constants/core/app_names.dart';
import '../controller/Bearish%20Bloc/bearish_cubit.dart';
import '../controller/Video Bloc/video_cubit.dart';
import '../controller/Welcome Bloc/welcome_cubit.dart';
import 'app_routs.dart';

class EaalimTajweed extends StatelessWidget {
  const EaalimTajweed._internal();
  static const EaalimTajweed _instance = EaalimTajweed._internal();
  factory EaalimTajweed() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeCubit(),
        ),
        BlocProvider(
          create: (context) => VideoCubit(),
        ),
        BlocProvider(
          create: (context) => BearishCubit(),
        ),
      ],
      child: MaterialApp(
        title: AppNames.titleEaalim,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.accent100,
            centerTitle: true,
            elevation: 0,
          ),
          scaffoldBackgroundColor: AppColors.backgroundPrimary,
        ),
        routes: {
          AppRouts.splashPage: (context) => const SplashPage(),
          AppRouts.welcomePage: (context) => const WelcomePage(),
          AppRouts.homePage: (context) => const HomePage(),
          AppRouts.download: (context) => const DownloadPage(),
          AppRouts.pdf: (context) => const PdfPage(),
          AppRouts.feadback: (context) => const FeadBackPage(),
          AppRouts.seb7a: (context) => const BearishPage(),
        },
      ),
    );
  }
}
