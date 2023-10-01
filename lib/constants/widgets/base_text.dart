import 'package:flutter/material.dart';

Widget baseTextApp({
  required String text,
  Color color = Colors.black,
  double fontSize = 25,
  FontWeight fontWeight = FontWeight.w600,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      inherit: true,
      fontStyle: fontStyle,
    ),
  );
}
