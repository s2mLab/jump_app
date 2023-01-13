import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '/providers/app_parameters.dart';
import '/providers/jump_app_theme.dart';
import 'helpers.dart';

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
    appParameters.setLevel(context, appParameters.level.next);
  }

  @override
  Widget build(BuildContext context) {
    final appParameters = AppParameters.of(context);
    final theme = JumpAppTheme.of(context);

    return SizedBox(
      width: theme.iconSizeHeader * 2,
      child: GestureDetector(
        child: Column(
          children: [
            Icon(
              Icons.stacked_line_chart_sharp,
              size: theme.iconSizeHeader,
              color: theme.colorHeaderPrimary,
            ),
            Text(
              appParameters.level.asText(context),
              style: theme.textStyleHeader,
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
    final theme = JumpAppTheme.of(context, listen: false);

    return Row(
      children: [
        Text('Translation', style: theme.textStyleHeader),
        SizedBox(
          width: deviceSize.width * 0.07,
          child: SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackColor: theme.colorHeaderPrimary,
              inactiveTrackColor: theme.colorHeaderPrimary,
              inactiveTrackHeight: deviceSize.width * 0.023,
              activeTrackHeight: deviceSize.width * 0.023,
              thumbColor: theme.colorHeaderSecondary,
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
        Text('Rotation', style: theme.textStyleHeader),
      ],
    );
  }
}

class _Help extends StatelessWidget {
  const _Help();

  void _swapLanguage(BuildContext context) {
    final theme = JumpAppTheme.of(context, listen: false);
    theme.texts.language = theme.texts.language == 'Fr' ? 'En' : 'Fr';
  }

  @override
  Widget build(BuildContext context) {
    final theme = JumpAppTheme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: theme.iconSizeHeader,
          color: theme.colorHeaderPrimary,
          icon: CircleAvatar(
            backgroundColor: theme.colorHeaderPrimary,
            foregroundColor: theme.colorHeaderSecondary,
            radius: 3 / 4 * theme.iconSizeHeader,
            child: Icon(
              Icons.question_mark,
              size: 3 / 4 * theme.iconSizeHeader,
            ),
          ),
          onPressed: () => showHelp(context,
              title: theme.texts.helpTitle, content: theme.texts.help),
        ),
        SizedBox(
          width: 3 * theme.fontSizeLanguageSelection,
          child: TextButton(
            onPressed: () => _swapLanguage(context),
            child: Text(
              theme.texts.language == 'Fr' ? 'En' : 'Fr',
              style: theme.textStyleHeader
                  .copyWith(fontSize: theme.fontSizeLanguageSelection),
            ),
          ),
        ),
      ],
    );
  }
}
