import 'App/app.dart';
import 'App/global.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Global.init();
  runApp(EaalimTajweed());
}
