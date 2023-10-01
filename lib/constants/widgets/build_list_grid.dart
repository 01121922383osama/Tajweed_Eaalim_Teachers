import 'package:flutter/material.dart';

import '../../Customs/custom_lottie_image.dart';
import '../core/app_colors.dart';
import '../core/app_images.dart';
import '../core/custtom_screen.dart';
import 'base_text.dart';
import 'box_shadow.dart';

Widget buildListGridView(
  BuildContext context, {
  required String text,
  void Function()? onTap,
  String? image,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15),
    splashColor: AppColors.red,
    onTap: onTap,
    child: Container(
      width: CustomMediaQuery(context).screenWidth,
      height: CustomMediaQuery(context).screenHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primary400,
        boxShadow: [...shadow],
      ),
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customImage(context,
              image: image != null
                  ? AppImages.imageCircle
                  : AppImages.imageCircle),
          FittedBox(
            alignment: Alignment.center,
            child: baseTextApp(text: text, fontSize: 15),
          ),
        ],
      ),
    ),
  );
}
