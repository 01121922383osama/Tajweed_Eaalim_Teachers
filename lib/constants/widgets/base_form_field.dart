import 'package:flutter/material.dart';

import '../core/custtom_screen.dart';



Widget baseTextFormField({
  BuildContext? context,
  required String? hintText,
  required String? labelText,
  bool? isDisAppear,
  IconButton? suffixIconData,
  Widget? prefixIcon,
  InputBorder? inputborder,
  required void Function(String value)? onChanged,
}) {
  final ValueNotifier<TextDirection> textInputDirection =
      ValueNotifier(TextDirection.ltr);

  return ValueListenableBuilder<TextDirection>(
    valueListenable: textInputDirection,
    builder: (context, value, child) => Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: CustomMediaQuery(context).screenWidth / 25,
      ),
      // height: CustomMediaQuery(context).screenHeight / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        autofocus: false,
        keyboardType: (hintText == 'Email' ||
                hintText == 'Password' ||
                hintText == 'RepeatPassword')
            ? TextInputType.emailAddress
            : null,
        autocorrect: true,
        enabled: true,
        minLines: 1,
        maxLines: 1,
        textDirection: value,
        decoration: InputDecoration(
          suffixIcon: (hintText == 'Password' || hintText == 'RepeatPassword')
              ? suffixIconData
              : null,
          hintText: hintText,
          prefixIcon: prefixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        textInputAction:
            (hintText == 'Password' && hintText == 'RepeatPassword')
                ? TextInputAction.done
                : TextInputAction.next,
        obscureText: (hintText == 'Password' || hintText == 'RepeatPassword')
            ? isDisAppear!
            : false,
        enableSuggestions: true,
        onChanged: (input) {
          if (input.trim().length < 2) {
            final directory = getDirection(input);
            if (directory != value) textInputDirection.value = directory;
          }
          onChanged != null ? onChanged(input) : () {};
        },
      ),
    ),
  );
}

TextDirection getDirection(String input) {
  final string = input.trim();
  if (string.isEmpty) return TextDirection.ltr;
  final firstUnit = string.codeUnitAt(0);
  if (firstUnit > 0x0600 && firstUnit < 0x06FF ||
      firstUnit > 0x0750 && firstUnit < 0x077F ||
      firstUnit > 0x07C0 && firstUnit < 0x07EA ||
      firstUnit > 0x0840 && firstUnit < 0x085B ||
      firstUnit > 0x08A0 && firstUnit < 0x08B4 ||
      firstUnit > 0x08E3 && firstUnit < 0x08FF ||
      firstUnit > 0xFB50 && firstUnit < 0xFBB1 ||
      firstUnit > 0xFBD3 && firstUnit < 0xFD3D ||
      firstUnit > 0xFD50 && firstUnit < 0xFD8F ||
      firstUnit > 0xFD92 && firstUnit < 0xFDC7 ||
      firstUnit > 0xFDF0 && firstUnit < 0xFDFC ||
      firstUnit > 0xFE70 && firstUnit < 0xFE74 ||
      firstUnit > 0xFE76 && firstUnit < 0xFEFC ||
      firstUnit > 0x10800 && firstUnit < 0x10805 ||
      firstUnit > 0x1B000 && firstUnit < 0x1B0FF ||
      firstUnit > 0x1D165 && firstUnit < 0x1D169 ||
      firstUnit > 0x1D16D && firstUnit < 0x1D172 ||
      firstUnit > 0x1D17B && firstUnit < 0x1D182 ||
      firstUnit > 0x1D185 && firstUnit < 0x1D18B ||
      firstUnit > 0x1D1AA && firstUnit < 0x1D1AD ||
      firstUnit > 0x1D242 && firstUnit < 0x1D244) {
    return TextDirection.rtl;
  }
  return TextDirection.ltr;
}
