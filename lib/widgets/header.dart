import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '/providers/app_parameters.dart';
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Menu(),
            _ChoseType(),
            _Help(),
          ],
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    final app = AppParameters.of(context);

    return GestureDetector(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Column(
        children: [
          Icon(Icons.menu, size: app.theme.iconSizeHeader),
          Text(app.texts.menu, style: app.theme.textStyleHeader)
        ],
      ),
    );
  }
}

/*
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
    final app = AppParameters.of(context);

    return SizedBox(
      width: app.theme.iconSizeHeader * 2,
      child: GestureDetector(
        child: Column(
          children: [
            Icon(
              Icons.stacked_line_chart_sharp,
              size: app.theme.iconSizeHeader,
              color: app.theme.colorHeaderPrimary,
            ),
            Text(
              app.level.asText(context),
              style: app.theme.textStyleHeader,
            ),
          ],
        ),
        onTap: () => _changeLevel(context),
      ),
    );
  }
}
*/

class _ChoseType extends StatelessWidget {
  const _ChoseType();

  void _changeType(BuildContext context) {
    final appParameters = AppParameters.of(context, listen: false);
    appParameters.type = appParameters.type.swap;
  }

  @override
  Widget build(BuildContext context) {
    final app = AppParameters.of(context);
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Text('Translation', style: app.theme.textStyleHeader),
        SizedBox(
          width: deviceSize.width * 0.07,
          child: SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackColor: app.theme.colorHeaderPrimary,
              inactiveTrackColor: app.theme.colorHeaderPrimary,
              inactiveTrackHeight: deviceSize.width * 0.023,
              activeTrackHeight: deviceSize.width * 0.023,
              thumbColor: app.theme.colorHeaderSecondary,
              thumbRadius: deviceSize.width * 0.008,
              overlayRadius: 0,
            ),
            child: SfSlider(
              value: app.type == AppType.rotation ? 1 : 0,
              min: 0 - deviceSize.width * 0.0005,
              max: 1 + deviceSize.width * 0.0005,
              onChanged: (value) => {},
              onChangeStart: (value) => _changeType(context),
            ),
          ),
        ),
        Text('Rotation', style: app.theme.textStyleHeader),
      ],
    );
  }
}

class _Help extends StatelessWidget {
  const _Help();

  void _swapLanguage(BuildContext context) {
    final app = AppParameters.of(context, listen: false);
    app.texts.language = app.texts.language == 'Fr' ? 'En' : 'Fr';
  }

  void _changeLevel(BuildContext context) {
    final appParameters = AppParameters.of(context, listen: false);
    appParameters.setLevel(context, appParameters.level.next);
  }

  @override
  Widget build(BuildContext context) {
    final app = AppParameters.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: app.texts.levelTooltip,
          iconSize: app.theme.iconSizeHeader,
          color: app.theme.colorHeaderPrimary,
          icon: CircleAvatar(
            backgroundColor: app.theme.colorHeaderPrimary,
            foregroundColor: app.theme.colorHeaderSecondary,
            radius: 3 / 4 * app.theme.iconSizeHeader,
            child: Icon(
              app.level == DetailLevel.easy
                  ? Icons.add_circle
                  : Icons.remove_circle,
              size: 3 / 4 * app.theme.iconSizeHeader,
            ),
          ),
          onPressed: () => _changeLevel(context),
        ),
        IconButton(
          tooltip: app.texts.modelTooltip,
          iconSize: app.theme.iconSizeHeader,
          color: app.theme.colorHeaderPrimary,
          icon: CircleAvatar(
            backgroundColor: app.theme.colorHeaderPrimary,
            foregroundColor: app.theme.colorHeaderSecondary,
            radius: 3 / 4 * app.theme.iconSizeHeader,
            child: Icon(
              Icons.calculate,
              size: 3 / 4 * app.theme.iconSizeHeader,
            ),
          ),
          onPressed: () => showModel(context,
              title: app.texts.modelTitle,
              content: app.texts.model,
              imageName: app.type == AppType.rotation
                  ? '${app.texts.modelFilename}_rotation.png'
                  : '${app.texts.modelFilename}_translation.png'),
        ),
        IconButton(
          iconSize: app.theme.iconSizeHeader,
          color: app.theme.colorHeaderPrimary,
          icon: CircleAvatar(
            backgroundColor: app.theme.colorHeaderPrimary,
            foregroundColor: app.theme.colorHeaderSecondary,
            radius: 3 / 4 * app.theme.iconSizeHeader,
            child: Icon(
              Icons.question_mark,
              size: 3 / 4 * app.theme.iconSizeHeader,
            ),
          ),
          onPressed: () => showHelp(
            context,
            title: app.texts.helpTitle,
            content: app.texts.helpText,
            imageName: 'assets/images/Logo_S2M_Patinage.png',
          ),
        ),
        SizedBox(
          width: 3 * app.theme.fontSizeLanguageSelection,
          child: TextButton(
            onPressed: () => _swapLanguage(context),
            child: Text(
              app.texts.language == 'Fr' ? 'En' : 'Fr',
              style: app.theme.textStyleHeader
                  .copyWith(fontSize: app.theme.fontSizeLanguageSelection),
            ),
          ),
        ),
      ],
    );
  }
}
