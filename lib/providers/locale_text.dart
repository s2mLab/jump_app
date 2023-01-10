import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  String get rotation => {'En': 'Rotation', 'Fr': 'Rotation'}[language]!;
  String get preRotation =>
      {'En': 'Prerotation', 'Fr': 'Prérotation'}[language]!;
  String get angularVelocity =>
      {'En': 'Ang. velocity', 'Fr': 'Vit. ang.'}[language]!;
  String get inertia => {'En': 'Inertia', 'Fr': 'Inertie'}[language]!;
  String get minimumInertia =>
      {'En': 'Min. inertia', 'Fr': 'Inertie min.'}[language]!;
  String get timeToMinimumInertia => {'En': 'Tmin', 'Fr': 'Tmin'}[language]!;

  String get aerialPhaseTooltip => {
        'En': 'Duration of the aerial phase',
        'Fr': 'Durée de la phase aérienne',
      }[language]!;
  String get angularVelocityTooltip => {
        'En': 'Initial angular velocity',
        'Fr': 'Vitesse de rotation initial',
      }[language]!;
  String get computedAerialPhaseTooltip => {
        'En': 'Computed duration of the aerial phase',
        'Fr': 'Durée calculée de la phase aérienne',
      }[language]!;
  String get computedFinalRotation => {
        'En': 'Computed rotation at landing in degrees',
        'Fr': 'Rotation calculée à l\'atterissage',
      }[language]!;
  String get computedMaximalHeight => {
        'En': 'Computed maximal height (apex) of the jump',
        'Fr': 'Hauteur maximale (apex) calculée du saut',
      }[language]!;
  String get fmaxTooltip => {
        'En': 'Maximal force exerted during the pushoff phase',
        'Fr': 'Force maximale exercée lors de la phase de propulsion',
      }[language]!;
  String get inertiaTooltip => {
        'En': 'Initial moment of inertia',
        'Fr': 'Moment d\'inertie initial',
      }[language]!;
  String get initialRotationTooltip => {
        'En': 'Initial body rotation',
        'Fr': 'Rotation initial du corps',
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
