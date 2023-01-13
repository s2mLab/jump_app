import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String get _tab => '\t\t\t\t';

class LocaleText with ChangeNotifier {
  LocaleText({required language}) : _language = language;

  String _language;
  set language(value) {
    _language = value;
    notifyListeners();
  }

  String get language => _language;

  static LocaleText of(BuildContext context, {bool listen = true}) {
    return Provider.of<LocaleText>(context, listen: listen);
  }

  String get template => {'En': 'Template', 'Fr': 'Canevas'}[language]!;

  String get pushoffPhase =>
      {'En': 'Pushoff phase', 'Fr': 'Phase de propulsion'}[language]!;
  String get aerialPhase =>
      {'En': 'Aerial phase', 'Fr': 'Phase aérienne'}[language]!;
  String get landing => {'En': 'Landing', 'Fr': 'Atterrissage'}[language]!;
  String get flight => {'En': 'Flight', 'Fr': 'Vol'}[language]!;
  String get inertia => {'En': 'Inertia', 'Fr': 'Inertie'}[language]!;

  String get angularVelocityTooltip => {
        'En': 'Angular velocity at takeoff',
        'Fr': 'Vitesse de rotation au décollage',
      }[language]!;
  String get computedAerialPhaseTooltip => {
        'En': 'Computed duration of the aerial phase',
        'Fr': 'Durée calculée de la phase aérienne',
      }[language]!;
  String get computedFinalRotation => {
        'En': 'Computed rotation at landing in degrees',
        'Fr': 'Rotation calculée à l\'atterissage',
      }[language]!;
  String get computedInitialVelocity => {
        'En': 'Computed initial velocity',
        'Fr': 'Vitesse d\'éjection calculée',
      }[language]!;
  String get computedMaximalHeight => {
        'En': 'Computed maximal height (apex) of the jump',
        'Fr': 'Hauteur maximale (apex) calculée du saut',
      }[language]!;
  String get flightTimeTooltip => {
        'En': 'Duration of the aerial phase',
        'Fr': 'Durée de la phase aérienne',
      }[language]!;
  String get fmaxTooltip => {
        'En': 'Maximal force exerted during the pushoff phase',
        'Fr': 'Force maximale exercée lors de la phase de propulsion',
      }[language]!;
  String get inertiaTooltip => {
        'En': 'Moment of inertia at takeoff',
        'Fr': 'Moment d\'inertie au décollage',
      }[language]!;
  String get initialRotationTooltip => {
        'En': 'Body rotation achieved during propulsion on the ice ',
        'Fr': 'Rotation du corps réalisée pendant la propulsion sur la glace',
      }[language]!;
  String get h0Tooltip => {
        'En': 'Height of the center of mass when flight phase starts',
        'Fr': 'Hauteur du centre de masse au début de la phase aérienne',
      }[language]!;
  String get hfTooltip => {
        'En': 'Height of the center of mass at landing',
        'Fr': 'Hauteur du centre de masse à l\'atterissage',
      }[language]!;
  String get landingPhaseTooltip => {
        'En': 'Duration of the landing phase',
        'Fr': 'Durée de la phase d\'atterissage',
      }[language]!;
  String get minimumInertiaTooltip => {
        'En': 'Minimum moment of inertia',
        'Fr': 'Moment d\'inertie minimum',
      }[language]!;
  String get pushoffPhaseLengthTooltip => {
        'En': 'Duration of the pushoff phase',
        'Fr': 'Durée de la phase de propulsion',
      }[language]!;
  String get timeToMinimumInertiaTooltip => {
        'En': 'Time to get to minimum moment of inertia',
        'Fr': 'Temps pour atteindre le moment d\'inertie minimum',
      }[language]!;

  String get flightTimeHelpTitle => {
        'En': 'Improve aerial phase',
        'Fr': 'Améliorer la phase aérienne',
      }[language]!;
  String get flightTimePhaseHelp => {
        'En': 'To improve the aerial phase duration time, you can:\n'
            '$_tab- Increase ...',
        'Fr': 'Pour augmener la durée de la phase aérienne, vous pouvez :\n'
            '$_tab- Augmenter ...',
      }[language]!;
  String get computedFinalRotationHelpTitle => {
        'En': 'Impove total rotation',
        'Fr': 'Améliorer la rotation totale',
      }[language]!;
  String get computedFinaleRotationHelp => {
        'En': 'To improve the total rotation of the jump, you can:\n'
            '$_tab- Increase ...',
        'Fr': 'Pour augmenter la rotation totale du saut, vous pouvez :\n'
            '$_tab- Augmenter ...',
      }[language]!;
  String get computedInitialVelocityHelpTitle => {
        'En': 'Impove initial velocity',
        'Fr': 'Améliorer la vitesse d\'éjection',
      }[language]!;
  String get computedInitialVelocityHelp => {
        'En': 'To improve the initial velocity, you can:\n'
            '$_tab- Increase ...',
        'Fr': 'Pour augmenter la vitesse d\'éjection, vous pouvez :\n'
            '$_tab- Augmenter ...',
      }[language]!;
  String get computedMaximalHeightHelpTitle => {
        'En': 'Impove maximal height',
        'Fr': 'Améliorer la hauteur du saut',
      }[language]!;
  String get computedMaximalHeightHelp => {
        'En': 'To improve the maximal jump height, you can:\n'
            '$_tab- Increase ...',
        'Fr': 'Pour augmenter la hauteur maximale du saut, vous pouvez :\n'
            '$_tab- Augmenter ...',
      }[language]!;

  String get easy => {
        'En': 'Easy',
        'Fr': 'Facile',
      }[language]!;
  String get medium => {
        'En': 'Medium',
        'Fr': 'Moyen',
      }[language]!;
  String get hard => {
        'En': 'Hard',
        'Fr': 'Difficile',
      }[language]!;

  String get helpTitle => {
        'En': 'Help',
        'Fr': 'Aide',
      }[language]!;
  String get help => {
        'En':
            'Change the values using the sliders and see the new performance in terms of height, time and rotation.',
        'Fr':
            'Changez les valeurs en utilisant les boutons et voyez les performances de hauteur, temps de vol et rotation.',
      }[language]!;
}
