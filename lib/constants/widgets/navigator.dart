import 'package:flutter/material.dart';

void navigateScreenpushNamedAndRemoveUntil(
  BuildContext context, {
  required String page,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    page,
    (route) => false,
  );
}

void navigateScreenpushNamed(
  BuildContext context, {
  required String page,
}) {
  Navigator.of(context).pushNamed(page);
}
