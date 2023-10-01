import '../constants/core/custtom_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget customLottieImage({required String image}) {
  return Lottie.asset(image);
}

Widget customImage(BuildContext context, {required String image}) {
  return Image(
    width: CustomMediaQuery(context).screenWidth / 5,
    fit: BoxFit.cover,
    image: AssetImage(image),
  );
}
