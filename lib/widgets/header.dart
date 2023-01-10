import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
        SizedBox(
          width: deviseSize.width * 0.07,
          child: SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackColor: Colors.black,
              inactiveTrackColor: Colors.black,
              inactiveTrackHeight: deviseSize.width * 0.023,
              activeTrackHeight: deviseSize.width * 0.023,
              thumbColor: Colors.white,
              thumbRadius: deviseSize.width * 0.008,
              overlayRadius: 0,
            ),
            child: SfSlider(
              value: appParameters.type == AppType.rotation ? 1 : 0,
              min: 0 - deviseSize.width * 0.0005,
              max: 1 + deviseSize.width * 0.0005,
              onChanged: (value) => {},
              onChangeStart: (value) => _changeType(context),
            ),
          ),
        ),
        Text(
          'Rotation',
          style: TextStyle(fontSize: deviseSize.width * 0.02),
        ),
      ],
    );
  }
}
