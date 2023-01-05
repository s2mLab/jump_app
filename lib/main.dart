import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/screens/jump_screen.dart';

void main() async {
  // Turn off portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Jump app', home: JumpScreen());
  }
}
