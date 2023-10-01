import '../../constants/widgets/box_shadow.dart';
import 'package:flutter/material.dart';

import '../../constants/core/app_names.dart';

class FeadBackPage extends StatelessWidget {
  const FeadBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(AppNames.feedback),
            Icon(
              Icons.colorize_rounded,
              size: 35,
              shadows: [...shadow],
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
