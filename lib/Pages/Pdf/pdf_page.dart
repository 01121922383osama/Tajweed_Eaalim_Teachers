import 'package:flutter/material.dart';

import '../../constants/core/app_names.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppNames.pdf),
      ),
    );
  }
}
