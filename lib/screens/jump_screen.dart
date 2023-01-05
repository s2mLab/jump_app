import 'package:flutter/material.dart';

import '/widgets/skater_image.dart';

class JumpScreen extends StatelessWidget {
  const JumpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SkaterImage()),
    );
  }
}
