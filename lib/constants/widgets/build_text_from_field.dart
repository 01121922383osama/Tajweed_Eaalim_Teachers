import 'package:flutter/material.dart';

import 'base_form_field.dart';

Widget buildTextfromField({
  required BuildContext context,
  String text = 'ADD text',
  double vertical = 15,
  void Function(String)? onChanged,
  IconData icon = Icons.email,
  IconButton? iconButton,
  bool isDisAppear = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: vertical,
    ),
    child: baseTextFormField(
      context: context,
      hintText: text,
      labelText: text,
      prefixIcon: Icon(icon),
      onChanged: onChanged,
      suffixIconData: iconButton,
      isDisAppear: isDisAppear,
    ),
  );
}
