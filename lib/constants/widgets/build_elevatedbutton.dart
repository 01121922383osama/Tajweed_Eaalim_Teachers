import 'package:flutter/material.dart';

import '../core/custtom_screen.dart';
import 'base_text.dart';

Widget buildElevatedButton({
  required BuildContext context,
  double horizontal = 10,
  double padding = 5,
  void Function()? onPressed,
  String text = 'ADD Text',
}) {
  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    width: CustomMediaQuery(context).screenWidth,
    child: ElevatedButton(
      onPressed: onPressed,
      child: baseTextApp(
        text: text,
      ),
    ),
  );
}
