import 'package:flutter/widgets.dart';

class CustomMediaQuery {
  final double screenWidth;
  final double screenHeight;
  final double textScaleFactor;
  final double blockSizeHorizontal;
  final double blockSizeVertical;

  CustomMediaQuery(BuildContext context)
      : screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height,
        textScaleFactor = MediaQuery.of(context).textScaleFactor,
        blockSizeHorizontal = MediaQuery.of(context).size.width / 100,
        blockSizeVertical = MediaQuery.of(context).size.height / 100;

  bool isLandscape() {
    return screenWidth > screenHeight;
  }
}
