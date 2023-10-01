import '../core/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildListTile(BuildContext context,
    {required String title, IconData? iconData, void Function()? onTap}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(
      iconData,
      color: AppColors.red,
    ),
    title: Text(
      title,
      style: _textStyle,
    ),
  );
}

TextStyle _textStyle = const TextStyle(
  color: AppColors.textPrimary,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
