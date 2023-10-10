import 'package:flutter/material.dart';

import 'App/app.dart';
import 'App/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(EaalimTajweed());
}
