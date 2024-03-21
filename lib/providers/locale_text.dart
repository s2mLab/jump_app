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

  String get colon => {'En': ':', 'Fr': ' :'}[language]!;

  String get drawerTitle =>
      {'En': 'Choice of the jump', 'Fr': 'Choix du saut'}[language]!;
  String get menu => {'En': 'Jumps', 'Fr': 'Sauts'}[language]!;

//TODO: add tooltip about exercises

  String get pushoffPhase =>
      {'En': 'Pushoff phase', 'Fr': 'Phase de propulsion'}[language]!;
  String get aerialPhase =>
      {'En': 'Aerial phase', 'Fr': 'Phase aérienne'}[language]!;
  String get landing => {'En': 'Landing', 'Fr': 'Atterrissage'}[language]!;
  String get flight => {'En': 'Flight', 'Fr': 'Vol'}[language]!;

  String get inertia =>
      {'En': 'Moment of inertia', 'Fr': 'Moment d\'inertie'}[language]!;
  String get inertiaTooltip => {
        'En': 'Moment of inertia at takeoff',
        'Fr': 'Moment d\'inertie au décollage',
      }[language]!;
  String get inertiaHelpTitle => {
        'En': 'Increase the moment of inertia at takeoff',
        'Fr': 'Augmenter le moment d\'inertie au décollage',
      }[language]!;
  String get inertiaHelp => {
        'En': 'To increase the moment of inertia at takeoff, \n'
            'the body segments (arms and free leg) must be moved away '
            'from the axis of rotation'
            '\nExamples of Values:'
            '\n$_tab\u{2799}Twist: 0.9 (backspin), 1.1 (anatomical posture), 2.9 (T pose), 5.4 kgm\u{00B2}(Axel take-off)'
            '\n$_tab\u{2799}Somersault: 4 (tuck), 6 (pike), 12 (layout), 15 kgm\u{00B2} (arms overhead).',
        'Fr': 'Pour augmenter le moment d\'inertie,\n'
            'il faut éloigner les segments (bras et jambe libre) '
            'de l\'axe de rotation'
            '\nExemples de Valeurs:'
            '\n$_tab\u{2799}Vrille: 0.9 (pirouette), 1.1 (position anatomique), 2.9 (pose en T), 5.4 kgm\u{00B2}(décollage en Axel)'
            '\n$_tab\u{2799}Salto: 4 (groupé), 6 (carpé), 12 (tendu), 15 kgm\u{00B2} (avec bras en haut).',
      }[language]!;

  String get angularVelocityTooltip => {
        'En': 'Angular velocity at takeoff',
        'Fr': 'Vitesse de rotation au décollage',
      }[language]!;
  String get angularVelocityHelpTitle => {
        'En': 'Increase angular velocity at takeoff',
        'Fr': 'Augmenter le vitesse de rotation au décollage',
      }[language]!;
  String get angularVelocityHelp => {
        'En': 'To increase the angular velocity at takeoff:\n'
            '$_tab\u{2799} Put most of your body segments in rotation '
            'in the same direction\n'
            '$_tab\u{2799} Start to move your body segments in rotation earlier or \n'
            '$_tab\u{2799} Increase your angular acceleration',
        'Fr': 'Pour augmenter la vitesse de rotation au décollage:\n'
            '$_tab\u{2799} Mettre le plus de segments possibles en rotation '
            'dans le même sens\n'
            '$_tab\u{2799} Initier le mouvement de rotation plus tôt \n'
            '$_tab\u{2799} Augmenter l\'accélération angulaire',
      }[language]!;

  String get computedMaximalHeight => {
        'En': 'Computed maximal height (apex) of the jump',
        'Fr': 'Hauteur maximale (apex) calculée du saut',
      }[language]!;
  String get computedMaximalHeightHelpTitle => {
        'En': 'Increase maximum height',
        'Fr': 'Augmenter la hauteur maximale',
      }[language]!;
  String get computedMaximalHeightHelp => {
        'En': 'To increase maximum heightof the center of mass:\n'
            '$_tab\u{2799} Increase take-off vertical velocity\n'
            '$_tab\u{2799} Increase take-off vertical position',
        'Fr': 'Pour augmenter la hauteur maximale du centre de masse :\n'
            '$_tab\u{2799} Augmenter la vitesse verticale au décollage\n'
            '$_tab\u{2799} Augmenter la hauteur du centre de masse au décollage',
      }[language]!;

  String get timeToMinimumInertiaTooltip => {
        'En': 'Time to reach the minimum moment of inertia',
        'Fr': 'Temps pour atteindre le moment d\'inertie minimum',
      }[language]!;
  String get timeToMinimumInertiaHelpTitle => {
        'En': 'Reduce time to Reach the minimum moment of inertia',
        'Fr': 'Réduire le temps pour atteindre le moment d\'inertie minimal',
      }[language]!;
  String get timeToMinimumInertiaHelp => {
        'En': 'To reduce time to reach the minimum moment of inertia,\n'
            'work on your movement speed. \n'
            'Due to centrifugal effects, the athlete must force to keep this position closed',
        'Fr': 'Pour réduire le temps pour atteindre le moment d\'inertie minimal, \n'
            'il faut travailler sur la vitesse de mouvement.\n\n'
            'À cause des efforts centrifuges, l\'athlète doit continuer de forcer pour garder la position fermée',
      }[language]!;

  String get open => {
        'En': 'open',
        'Fr': 'ouvre', // TODO: Find a better word
      }[language]!;
  String get timeToFinalInertiaTooltip => {
        'En': 'Time to reach the landing moment of inertia',
        'Fr': 'Temps pour atteindre le moment d\'inertie d\'atterrissage',
      }[language]!;
  String get timeToFinalInertiaHelpTitle => {
        'En': 'Reduce time to Reach the landing moment of inertia',
        'Fr':
            'Réduire le temps pour atteindre le moment d\'inertie d\'atterrissage',
      }[language]!;
  String get timeToFinalInertiaHelp => {
        'En': 'To reduce time to reach the landing moment of inertia,\n'
            'better anticipate the landing instant, therefore several repetitions are needed.\n\n'
            'In backward somersault, vision is key in the opening phase',
        'Fr': 'Pour réduire le temps pour atteindre le moment d\'inertie d\'atterrissage,\n'
            'il faut mieux anticiper l\'instant de réception donc faire beaucoup de répétitions.\n\n'
            'En salto arrière, la vision permet de réguler cette phase d\'ouverture.',
      }[language]!;
  //TODO: text final inertia: how to improve??

  String get computedFinalRotation => {
        'En': 'Computed rotation at landing in rotations',
        'Fr': 'Rotation calculée à l\'atterissage',
      }[language]!;
  String get computedFinalRotationHelpTitle => {
        'En': 'Increase total rotation',
        'Fr': 'Augmenter la rotation totale',
      }[language]!;
  String get computedFinalRotationHelp => {
        'En': 'To improve the total rotation of the jump, you need to:\n'
            '$_tab\u{2799} Increase the flight time\n'
            '$_tab\u{2799} Increase the angular momentum at takeoff (I\u{2080} x \u{03C9}\u{2080})\n'
            '$_tab\u{2799} Decrease the mimimum moment of inertia\n'
            '$_tab\u{2799} Decrease the time to reach this position',
        'Fr': 'Pour augmenter la rotation totale du saut, vous devez :\n'
            '$_tab\u{2799} Allonger la durée de la phase aérienne\n'
            '$_tab\u{2799} Augmenter le moment cinétique au décollage (I\u{2080} x \u{03C9}\u{2080})\n'
            '$_tab\u{2799} Réduire le moment d\'inertie minimal\n'
            '$_tab\u{2799} Réduire le temps pour atteindre cette position',
      }[language]!;

  String get pushoffPhaseLengthTooltip => {
        'En': 'Duration of the pushoff phase',
        'Fr': 'Durée de la phase de propulsion',
      }[language]!;
  String get pushoffPhaseLengthHelpTitle => {
        'En': 'Increase aerial phase duration',
        'Fr': 'Allonger la phase de propulsion',
      }[language]!;
  String get pushoffPhaseLengthHelp => {
        'En': 'To increase the duration of the pushoff phase, \n'
            'you can start in a deeper squat position:\n'
            '$_tab\u{2799} more hip and knee flexion\n$_tab\u{2799} arms down when starting  pushoff',
        'Fr': 'Pour augmenter la durée de la phase de propulsion, \n'
            'il faut partir dans une position plus basse :\n'
            '$_tab\u{2799} plus de flexion aux hanches et genoux\n'
            '$_tab\u{2799} commencer l\'impulsion les bras en bas',
      }[language]!;

  String get minimumInertiaTooltip => {
        'En': 'Minimum moment of inertia',
        'Fr': 'Moment d\'inertie minimum',
      }[language]!;
  String get minimumInertiaHelpTitle => {
        'En': 'Reduce the moment of inertia in aerial phase',
        'Fr': 'Réduire le moment d\'inertie en phase aérienne',
      }[language]!;
  String get minimumInertiaHelp => {
        'En': 'To reduce the moment of inertia in aerial phase in twist: \n'
            '$_tab\u{2799} Extend the body and cross the legs, \n'
            '$_tab\u{2799} Put the arms on your chest or extended overhead \n\n'
            'To reduce the moment of inertia in aerial phase in somersault: \n'
            '$_tab\u{2799} Compact tuck position \n'
            '\nExamples of Values:'
            '\n$_tab\u{2799}Twist: 0.9 (backspin), 1.1 (anatomical posture), 2.9 (T pose), 5.4 kgm\u{00B2}(Axel take-off)'
            '\n$_tab\u{2799}Somersault: 4 (tuck), 6 (pike), 12 (layout), 15 kgm\u{00B2} (arms overhead).',
        'Fr': 'Pour réduire le moment d\'inertie en phase aérienne en vrille: \n'
            '$_tab\u{2799} Étendre le corps et croiser les jambes, \n'
            '$_tab\u{2799} Placer les bras contre la poitrine '
            'ou les mettre tendus au-dessus de la tête \n\n'
            'Pour réduire le moment d\'inertie en phase aérienne en salto: \n'
            '$_tab\u{2799} Position groupée compacte, \n'
            '\nExemples de Valeurs:'
            '\n$_tab\u{2799}Vrille: 0.9 (pirouette), 1.1 (position anatomique), 2.9 (pose en T), 5.4 kgm\u{00B2}(décollage en Axel)'
            '\n$_tab\u{2799}Salto: 4 (groupé), 6 (carpé), 12 (tendu), 15 kgm\u{00B2} (avec bras en haut).',
      }[language]!;
//TODO: add examples -- dissociate somersault en figure skating in Help
//Back somersault : XX unit -> tuck; XX -> pike; XX -> layout
//Figure skating: XX -> xxx

  String get computedInitialVelocity => {
        'En': 'Computed initial velocity',
        'Fr': 'Vitesse d\'éjection calculée',
      }[language]!;
  String get computedInitialVelocityHelpTitle => {
        'En': 'Increase initial velocity',
        'Fr': 'Augmenter la vitesse d\'éjection',
      }[language]!;
  String get computedInitialVelocityHelp => {
        'En': 'To increase the initial velocity, you can:\n'
            '$_tab\u{2799} Increase the pushoff impulse by\n'
            '$_tab$_tab 1. Increasing the pushoff duration\n'
            '$_tab$_tab 2. Increasing the maximum vertical force\n'
            '$_tab\u{2799} Decrease body weight (in a long term and if relevant)',
        'Fr': 'Pour augmenter la vitesse d\'éjection, vous pouvez :\n'
            '$_tab\u{2799} Augmenter l\'impulsion de la phase de propulsion en\n'
            '$_tab$_tab 1. Augmentant la durée de la phase de propulsion\n'
            '$_tab$_tab 2. Augmentant la force maximale \n'
            '$_tab\u{2799} (à long terme et si pertient) Réduire la masse',
      }[language]!;

  String get computedMaximalAngularVelocity => {
        'En': 'Computed maximal angular velocity of the jump',
        'Fr': 'Vitesse de rotation maximale du saut',
      }[language]!;
  String get computedMaximalAngularVelocityHelpTitle => {
        'En': 'Increase maximal angular velocity',
        'Fr': 'Augmenter la vitesse maximale de rotation',
      }[language]!;
  String get computedMaximalAngularVelocityHelp => {
        'En': 'To improve the maximal angular velocity, you can:\n'
            '$_tab\u{2799} Increase initial angular momentum: I\u{2080} x \u{03C9}\u{2080}\n'
            '$_tab\u{2799} Reduce minimum moment of inertia in aerial phase \n',
        //'$_tab$_tab and time to reach this position',
        'Fr': 'Pour augmenter la vitesse maximale de rotation du saut, vous pouvez :\n'
            '$_tab\u{2799} Augmenter le moment cinétique initial : I\u{2080} x \u{03C9}\u{2080}\n'
            '$_tab\u{2799} Réduire le moment d\'inertie mininal en phase aérienne et \n',
      }[language]!;

  String get computedAerialPhaseTooltip => {
        'En': 'Computed duration of the aerial phase',
        'Fr': 'Durée calculée de la phase aérienne',
      }[language]!;
  String get computedAerialPhaseHelpTitle => {
        'En': 'Increase duration of the aerial phase',
        'Fr': 'Augmenter la durée de la phase aérienne',
      }[language]!;
  String get computedAerialPhaseHelp => {
        'En': 'To increase the duration of the aerial phase:\n'
            '$_tab\u{2799} Increase takeoff vertical velocity\n'
            '$_tab\u{2799} Increase height of the center of mass at takeoff\n'
            '$_tab\u{2799} Decrease height of the center of mass at landing',
        'Fr': 'Pour augmenter la durée de la phase aérienne :\n'
            '$_tab\u{2799} Augmenter la vitesse verticale au décollage\n'
            '$_tab\u{2799} Augmenter la hauteur du centre de masse au décollage\n'
            '$_tab\u{2799} Réduire la hauteur du centre de masse à l\'atterrisage',
      }[language]!;

  String get fmaxTooltip => {
        'En': 'Maximal force (in bodyweight) exerted during the pushoff phase',
        'Fr':
            'Force maximale (en poids de corps) exercée lors de la phase de propulsion',
      }[language]!;
  String get fmaxHelpTitle => {
        'En': 'Increase the maximal vertical force ',
        'Fr': 'Augmenter la force maximale verticale',
      }[language]!;
  String get fmaxHelp => {
        'En': 'To increase the maximal vertical force:\n'
            '$_tab\u{2799} Provide a training based on power of lower-limbs\n'
            '$_tab\u{2799} Provide a training based on full-body coordination',
        'Fr': 'Pour augmenter la force maximale verticale\n'
            '$_tab\u{2799} Proposer un entrainement en puissance des membres inférieurs\n'
            '$_tab\u{2799} Proposer un entrainement en coordination du corps complet',
      }[language]!;

  String get h0Tooltip => {
        'En': 'Height of the center of mass at takeoff',
        'Fr': 'Hauteur du centre de masse au décollage',
      }[language]!;
  String get h0HelpTitle => {
        'En': 'Increase height of the center of mass at takeoff',
        'Fr': 'Augmenter la hauteur du centre de masse au décollage',
      }[language]!;
  String get h0Help => {
        'En': 'To increase height of the center of mass at takeoff:\n'
            '$_tab\u{2799} Fully extend the support leg(s),\n'
            '$_tab\u{2799} Rise your arms and free leg (in figure skating)',
        'Fr': 'Pour augmenter la hauteur du centre de masse au décollage :\n'
            '$_tab\u{2799} Extension complète de la ou des jambe(s) d\'appui\n'
            '$_tab\u{2799} Lever les bras et la jambe libre (patinage artistique)',
      }[language]!;

  String get initialRotationTooltip => {
        'En': 'Body rotation achieved during propulsion',
        'Fr': 'Rotation du corps réalisée pendant la propulsion',
      }[language]!;
  String get initialRotationHelpTitle => {
        'En': 'Body rotation during pushoff',
        'Fr': 'Rotation du corps lors de la propulsion',
      }[language]!;
  String get initialRotationHelp => {
        'En': 'Too much initial rotation may help complete the rotation \n'
            'but may be penalized by judges',
        'Fr':
            'Une rotation exagérée peut aider à compléter la rotation du saut\n'
                'mais risque d\'être péalisée par les juges',
      }[language]!;

  String get hfTooltip => {
        'En': 'Height of the center of mass at landing',
        'Fr': 'Hauteur du centre de masse à l\'atterissage',
      }[language]!;
  String get hfHelpTitle => {
        'En': 'Height of the center of mass at landing',
        'Fr': 'Hauteur du centre de masse à l\'atterissage',
      }[language]!;
  String get hfHelp => {
        'En': 'Reducing the height of the mass center at landing may give '
            'extra flight time,\nbut lets less time to land properly',
        'Fr':
            'Réduire la hauteur du centre de masse à l\'atterissage peut augmenter '
                'le temps de vol,\nmais laisse moins de temps pour la réception',
      }[language]!;

  String get landingPhaseTooltip => {
        'En': 'Duration of the landing phase',
        'Fr': 'Durée de la phase d\'atterissage',
      }[language]!;

  String get levelTooltip => {
        'En': 'Number of parameters',
        'Fr': 'Nombre de paramètres',
      }[language]!;

  String get modelTooltip => {
        'En': 'Biomechanical model',
        'Fr': 'Modèle biomécanique',
      }[language]!;

  String get easy => {
        'En': 'Simple',
        'Fr': 'Simple',
      }[language]!;
  String get medium => {
        'En': 'Detail',
        'Fr': 'Détails',
      }[language]!;
  String get hard => {
        'En': 'Hard',
        'Fr': 'Difficile',
      }[language]!;

  String get help_Title => {
        'En': 'Help',
        'Fr': 'Aide',
      }[language]!;

  String get help_Text => {
        'En': 'Choose your jump on the left menu; '
            'Play with the sliders and see the new performance:\n'
            '$_tab\u{2022} takeoff vertical velocity, maximum height, flight time,\n'
            '$_tab\u{2022} maximum angular velocity, and total rotation.\n\n'
            'Switch between translation and rotation to change all parameters.\n'
            'Use + or - button to have acces to more or less parameters.\n'
            'Use tooltips and helps to learn more about each parameter.\n\n'
            '\nCredits: '
            'App developed by Benjamin Michaud and Mickael Begon '
            '(S2M lab)\n $_tab$_tab in collaboration with Patinage Québec '
            '(Synergic project 2022-2023)',
        'Fr': 'Choisir un saut dans le menu à gauche; '
            'Changer les valeurs avec les curseurs et observer les performances :\n'
            '$_tab\u{2022} vitesse vertical de décollage, hauteur maximale, temps de vol,\n'
            '$_tab\u{2022} vitesse maximale de rotation et rotation totale.\n\n'
            'Utiliser l\'interrupteur pour passer des paramètres en translation à ceux en rotation.\n'
            'Utiliser le button + ou - pour avoir accès à plus ou moins de paramètres.\n'
            'Utiliser les info-bulles et les aides pour en apprendre plus sur chaque paramètre.\n\n'
            '\nCrédits : '
            'App développée par Benjamin Michaud et Mickael Begon '
            '(Laboratoire S2M)\n $_tab$_tab en collaboration avec Patinage Québec '
            '(projet Synergie 2022-2023)',
      }[language]!;

  String get model => {
        'En':
            '', //We used the following simple model to predict the performance: ',
        'Fr':
            '', //Nous avons utilisé le modèle simple suivant pour prédire la performance : ',
      }[language]!;

  String get modelTitle => {
        'En': 'Biomechanical Model used to predict performance',
        'Fr': 'Modèle Biomécanique pour prédire la performance',
      }[language]!;

  String get modelFilename => {
        'En': 'assets/images/biomech_model',
        'Fr': 'assets/images/modele_biomeca',
      }[language]!;
}
