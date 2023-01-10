import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '/providers/app_parameters.dart';
import '/providers/locale_text.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.03,
            vertical: deviceSize.width * 0.005),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _ChoseLevel(),
            _ChoseType(),
            _Help(),
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
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      width: deviceSize.width * 0.08,
      child: GestureDetector(
        child: Column(
          children: [
            Icon(
              Icons.stacked_line_chart_sharp,
              size: deviceSize.width * 0.05,
            ),
            Text(
              appParameters.level.asText(context),
              style: TextStyle(fontSize: deviceSize.width * 0.02),
            ),
          ],
        ),
        onTap: () => _changeLevel(context),
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
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Text(
          'Translation',
          style: TextStyle(fontSize: deviceSize.width * 0.02),
        ),
        SizedBox(
          width: deviceSize.width * 0.07,
          child: SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackColor: Colors.black,
              inactiveTrackColor: Colors.black,
              inactiveTrackHeight: deviceSize.width * 0.023,
              activeTrackHeight: deviceSize.width * 0.023,
              thumbColor: Colors.white,
              thumbRadius: deviceSize.width * 0.008,
              overlayRadius: 0,
            ),
            child: SfSlider(
              value: appParameters.type == AppType.rotation ? 1 : 0,
              min: 0 - deviceSize.width * 0.0005,
              max: 1 + deviceSize.width * 0.0005,
              onChanged: (value) => {},
              onChangeStart: (value) => _changeType(context),
            ),
          ),
        ),
        Text(
          'Rotation',
          style: TextStyle(fontSize: deviceSize.width * 0.02),
        ),
      ],
    );
  }
}

class _Help extends StatelessWidget {
  const _Help();

  void _showHelp(BuildContext context) async {
    final texts = LocaleText.of(context, listen: false);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(texts.helpTitle),
          content: Text(texts.help),
        );
      },
    );
  }

  void _swapLanguage(BuildContext context) {
    final texts = LocaleText.of(context, listen: false);
    texts.language = texts.language == 'Fr' ? 'En' : 'Fr';
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final texts = LocaleText.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: deviceSize.width * 0.04,
          color: Colors.white,
          icon: CircleAvatar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            radius: deviceSize.width * 0.03,
            child: Icon(
              Icons.question_mark,
              size: deviceSize.width * 0.03,
            ),
          ),
          onPressed: () => _showHelp(context),
        ),
        SizedBox(
          width: deviceSize.width * 0.06,
          child: TextButton(
            onPressed: () => _swapLanguage(context),
            child: Text(
              texts.language == 'Fr' ? 'En' : 'Fr',
              style: TextStyle(
                  color: Colors.black, fontSize: deviceSize.width * 0.025),
            ),
          ),
        ),
      ],
    );
  }
}
