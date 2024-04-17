import 'package:flutter/material.dart';
import 'package:jump_app/providers/app_parameters.dart';
import 'package:jump_app/screens/jump_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsAndServicesScreen extends StatelessWidget {
  const TermsAndServicesScreen({super.key});

  static const route = '/terms-and-services-screen';

  final sharedPrefName = 'hasAlreadyAcceptedTermsAndServices';

  Future<bool> _haveAlreadyAcceptedTermsAndServices(context) async {
    final prefs = await SharedPreferences.getInstance();

    final hasAccepted = prefs.getBool(sharedPrefName) ?? false;

    if (hasAccepted) {
      WidgetsBinding.instance
          .addPostFrameCallback((timeStamp) => _continueToApp(context));
    }

    return hasAccepted;
  }

  Future<void> _acceptTermsAndServices(context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(sharedPrefName, true);
    _continueToApp(context);
  }

  Future<void> _continueToApp(BuildContext context) async {
    if (!context.mounted) return;
    Navigator.of(context).pushReplacementNamed(JumpScreen.route);
  }

  void _swapLanguage(BuildContext context) {
    final app = AppParameters.of(context, listen: false);
    app.texts.language = app.texts.language == 'Fr' ? 'En' : 'Fr';
  }

  @override
  Widget build(context) {
    final app = AppParameters.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 12.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 3 * app.theme.fontSizeLanguageSelection,
                child: TextButton(
                  onPressed: () => _swapLanguage(context),
                  child: Text(
                    app.texts.language == 'Fr' ? 'En' : 'Fr',
                    style: app.theme.textStyleHeader.copyWith(
                        fontSize: app.theme.fontSizeLanguageSelection),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: FutureBuilder<bool>(
                  future: _haveAlreadyAcceptedTermsAndServices(context),
                  builder: (context, snapshot) {
                    if (snapshot.data == null || snapshot.data!) {
                      return Container();
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        Text(app.texts.termsAndServicesTitle,
                            style: const TextStyle(fontSize: 24)),
                        Text(app.texts.termsAndServices),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () =>
                                    _acceptTermsAndServices(context),
                                child: Text(app.texts.termsAndServicesButton)),
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
