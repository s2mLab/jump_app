import 'package:flutter/material.dart';

import '/providers/app_parameters.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final deviseSize = MediaQuery.of(context).size;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviseSize.width * 0.03,
            vertical: deviseSize.width * 0.005),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _ChoseLevel(),
            _ChoseType(),
            Text('coucou'),
          ],
        ),
      ),
    );
  }
}

class _ChoseLevel extends StatelessWidget {
  const _ChoseLevel({
    Key? key,
  }) : super(key: key);

  void _changeLevel(BuildContext context) {
    final appParameters = AppParameters.of(context, listen: false);
    appParameters.level = appParameters.level.next;
  }

  @override
  Widget build(BuildContext context) {
    final appParameters = AppParameters.of(context);
    final deviseSize = MediaQuery.of(context).size;

    return SizedBox(
      width: deviseSize.width * 0.08,
      child: Column(
        children: [
          GestureDetector(
            child: Icon(
              Icons.stacked_line_chart_sharp,
              size: deviseSize.width * 0.05,
            ),
            onTap: () => _changeLevel(context),
          ),
          Text(
            appParameters.level.asText(context),
            style: TextStyle(fontSize: deviseSize.width * 0.02),
          ),
        ],
      ),
    );
  }
}

class _ChoseType extends StatelessWidget {
  const _ChoseType({
    Key? key,
  }) : super(key: key);

  void _changeType(BuildContext context) {
    final appParameters = AppParameters.of(context, listen: false);
    appParameters.type = appParameters.type.swap;
  }

  @override
  Widget build(BuildContext context) {
    final appParameters = AppParameters.of(context);
    final deviseSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Text(
          'Translation',
          style: TextStyle(fontSize: deviseSize.width * 0.02),
        ),
        Switch(
          value: appParameters.type == AppType.rotation,
          onChanged: (value) => _changeType(context),
          thumbColor: const MaterialStatePropertyAll(Colors.orange),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected) ? Colors.amber : null),
        ),
        Text(
          'Rotation',
          style: TextStyle(fontSize: deviseSize.width * 0.02),
        ),
      ],
    );
  }
}
