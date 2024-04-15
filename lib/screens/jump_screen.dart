import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';
import '/widgets/skater_image.dart';

class JumpScreen extends StatelessWidget {
  const JumpScreen({super.key});

  static const route = '/jump-screen';

  void _chooseBackground(BuildContext context, choice) {
    AppParameters.of(context, listen: false)
        .setJumpDescription(context, choice);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final app = AppParameters.of(context);

    return Scaffold(
      body: const Center(child: SkaterImage()),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.amber),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Text(
                  app.texts.drawerTitle,
                  style: app.theme.textStyleDrawerTitle,
                ),
              ),
            ),
            ..._buildAllChoices(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAllChoices(BuildContext context) {
    final app = AppParameters.of(context);

    final out = <Widget>[];
    for (final choice in JumpDescription.values) {
      out.add(ListTile(
        title: Text(choice.name, style: app.theme.textStyleDrawerTile),
        onTap: () => _chooseBackground(context, choice),
      ));
    }
    return out;
  }
}
