import 'package:flutter/material.dart';

import '/providers/jump_app_theme.dart';
import '/widgets/skater_image.dart';

enum _JumperScreenChoices {
  axel,
  lutz,
}

extension _JumperScreenChoicesExtension on _JumperScreenChoices {
  String get path {
    switch (this) {
      case (_JumperScreenChoices.axel):
        return 'assets/images/key_frames_axel.png';
      case (_JumperScreenChoices.lutz):
        return 'assets/images/key_frames_lutz.png';
    }
  }

  String get name {
    switch (this) {
      case (_JumperScreenChoices.axel):
        return 'Axel';
      case (_JumperScreenChoices.lutz):
        return 'Lutz';
    }
  }
}

class JumpScreen extends StatefulWidget {
  const JumpScreen({super.key});

  @override
  State<JumpScreen> createState() => _JumpScreenState();
}

class _JumpScreenState extends State<JumpScreen> {
  _JumperScreenChoices _currentJump = _JumperScreenChoices.axel;

  void _chooseBackground(BuildContext context, choice) {
    _currentJump = choice;
    setState(() {});

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = JumpAppTheme.of(context);

    return Scaffold(
      body: Center(child: SkaterImage(_currentJump.path)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.amber),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Text(
                  theme.texts.drawerTitle,
                  style: theme.textStyleDrawerTitle,
                ),
              ),
            ),
            ..._buildAllChoices(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAllChoices() {
    final theme = JumpAppTheme.of(context);

    final out = <Widget>[];
    for (final choice in _JumperScreenChoices.values) {
      out.add(ListTile(
        title: Text(choice.name, style: theme.textStyleDrawerTile),
        onTap: () => _chooseBackground(context, choice),
      ));
    }
    return out;
  }
}
