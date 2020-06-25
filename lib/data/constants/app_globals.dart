import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/data/models/navbar_item_model.dart'
    show NavBarItemModel;

class AppTheme {
  static ThemeData defaultAppTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      color: Colors.blueGrey,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 1.0,
      brightness: Brightness.light,
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: Colors.white70,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
      ),
      caption: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
  static const Color confirmedColorFill = Color(0xFFFFE6CC);
  static const Color confirmedColorBorder = Color(0xFFD79B00);
  static const Color recoveredColorFill = Color(0xFFD5E8D4);
  static const Color recoveredColorBorder = Color(0xFF82B366);
  static const Color deathsColorFill = Color(0xFFF8CECC);
  static const Color deathsColorBorder = Color(0xFFB85450);
}

class AppConstants {
  static const String applicationName = 'CORONED\n';
  static const String applicationVersion = '\nv1.5.5';
  static const String applicationIcon = 'assets/virus-logo.png';
  static const String applicationLegalese =
      'CORONED est à la base un projet scolaire réalisé pour répondre à un sujet de\ntravaux pratiques dans un cours de développement web dispensé par le CESI Dijon-Quetigny.'
      '\n\nNous avions le choix sur la technologie, alors nous avons formé un groupe pour\ntenter d\'utiliser la version web de Flutter...'
      '\n\nAprès un examen couronné de succès,\nl\'application évolue ! 🚀 Nous acceptons avec plaisir les contributions !! 🔥'
      '\n\nRendez-vous sur github.com/rcdevril/cesi_covid_19_tracker !\n\nVous trouverez ci-jointes les licences associées aux softwares utilisés pour la réalisation de ce projet Flutter.';
  static const String defaultAppTitle = '$applicationName\nA covid-19 info app';
  static const String cesiDijonUrl = 'https://dijon.cesi.fr/';
  static const List<NavBarItemModel> navItems = [
    NavBarItemModel(
      title: 'DASHBOARD',
      iconData: Icons.blur_circular,
      navigationPath: '/dashboard',
    ),
    NavBarItemModel(
      title: 'COUNTRIES',
      iconData: Icons.location_searching,
      navigationPath: '/country',
    ),
    NavBarItemModel(
      title: 'FAQ',
      iconData: Icons.question_answer,
      navigationPath: '/faq',
    ),
    NavBarItemModel(
      title: 'ABOUT',
      iconData: Icons.info_outline,
      navigationPath: '/about',
    )
  ];
}

class FAQDataSource {
  static List<Map<String, String>> questionReponse = [
    {
      'question': 'Qu\'est-ce qu\'un coronavirus ?',
      'answer':
          'Les coronavirus sont une grande famille de virus qui peuvent provoquer des maladies chez les animaux ou les humains.  Chez l\'homme, plusieurs coronavirus sont connus pour provoquer des infections respiratoires allant du simple rhume à des maladies plus graves telles que le syndrome respiratoire du Moyen-Orient (MERS) et le syndrome respiratoire aigu sévère (SRAS). Le coronavirus le plus récemment découvert provoque la maladie coronavirale COVID-19'
    },
    {
      'question': 'Qu\'est-ce que COVID-19 ?',
      'answer':
          'COVID-19 est la maladie infectieuse causée par le coronavirus le plus récemment découvert. Ce nouveau virus et cette nouvelle maladie étaient inconnus avant le début de l\'épidémie à Wuhan, en Chine, en décembre 2019'
    },
    {
      'question': 'Quels sont les symptômes de la COVID-19 ?',
      'answer':
          'Les symptômes les plus courants de COVID-19 sont la fièvre, la fatigue et la toux sèche. Certains patients peuvent avoir des douleurs, une congestion nasale, un écoulement nasal, un mal de gorge ou de la diarrhée. Ces symptômes sont généralement légers et commencent progressivement. Certaines personnes sont infectées mais ne développent aucun symptôme et ne se sentent pas mal. La plupart des personnes (environ 80 %) se remettent de la maladie sans avoir besoin d\'un traitement spécial. Environ 1 personne sur 6 qui contracte la COVID-19 devient gravement malade et développe des difficultés respiratoires. Les personnes âgées et celles qui souffrent de problèmes médicaux sous-jacents comme l\'hypertension, les problèmes cardiaques ou le diabète, sont plus susceptibles de développer une maladie grave. Les personnes qui ont de la fièvre, de la toux et des difficultés à respirer doivent consulter un médecin'
    },
    {
      'question': 'Comment COVID-19 se répand-il ?',
      'answer':
          'Les gens peuvent attraper COVID-19 par d\'autres personnes qui ont le virus. La maladie peut se transmettre d\'une personne à l\'autre par de petites gouttelettes provenant du nez ou de la bouche qui se propagent lorsqu\'une personne atteinte de COVID-19 tousse ou expire. Ces gouttelettes se posent sur les objets et les surfaces autour de la personne. D\'autres personnes attrapent ensuite COVID-19 en touchant ces objets ou surfaces, puis en se touchant les yeux, le nez ou la bouche. Les personnes peuvent également attraper COVID-19 si elles respirent les gouttelettes d\'une personne atteinte de COVID-19 qui tousse ou expire des gouttelettes. C\'est pourquoi il est important de se tenir à plus d\'un mètre d\'une personne malade. \NL\'OMS évalue les recherches en cours sur les modes de propagation de COVID-19 et continuera à partager les résultats actualisés'
    },
    {
      'question':
          'Le virus qui provoque le COVID-19 peut-il être transmis par l\'air ?',
      'answer':
          'Les études réalisées à ce jour suggèrent que le virus qui cause la COVID-19 se transmet principalement par contact avec des gouttelettes respiratoires plutôt que par l\'air'
    },
    {
      'question':
          'La CoVID-19 peut-elle être attrapée chez une personne qui ne présente aucun symptôme ?',
      'answer':
          'La maladie se propage principalement par les gouttelettes respiratoires expulsées par une personne qui tousse. Le risque d\'attraper la COVID-19 d\'une personne ne présentant aucun symptôme est très faible. Cependant, de nombreuses personnes atteintes de COVID-19 ne présentent que des symptômes légers. Cela est particulièrement vrai aux premiers stades de la maladie. Il est donc possible d\'attraper COVID-19 chez une personne qui ne présente, par exemple, qu\'une légère toux et ne se sent pas malade.  L\'OMS évalue les recherches en cours sur la période de transmission de COVID-19 et continuera à partager les résultats actualisés.'
    },
    {
      'question':
          'Puis-je attraper COVID-19 à partir des selles d\'une personne atteinte de la maladie ?',
      'answer':
          'Le risque d\'attraper la COVID-19 par les selles d\'une personne infectée semble faible. Bien que les enquêtes initiales suggèrent que le virus peut être présent dans les matières fécales dans certains cas, la propagation par cette voie n\'est pas une caractéristique principale de l\'épidémie. L\'OMS évalue les recherches en cours sur les modes de propagation de la COVID-19 et continuera à partager les nouvelles découvertes. Mais comme il s\'agit d\'un risque, c\'est une raison supplémentaire de se laver les mains régulièrement, après être allé aux toilettes et avant de manger'
    },
    {
      'question': 'Qui risque de développer une maladie grave ?',
      'answer':
          'Alors que nous sommes encore en train d\'apprendre comment COVID-2019 affecte les gens, les personnes âgées et les personnes souffrant de conditions médicales préexistantes (comme l\'hypertension, les maladies cardiaques, les maladies pulmonaires, le cancer ou le diabète) semblent développer des maladies graves plus souvent que les autres. '
    },
    {
      'question': 'Dois-je porter un masque pour me protéger ?',
      'answer':
          'Ne portez un masque que si vous présentez des symptômes de COVID-19 (en particulier la toux) ou si vous vous occupez d\'une personne qui pourrait être atteinte de COVID-19. Le masque facial jetable ne peut être utilisé qu\'une seule fois. Si vous n\'êtes pas malade ou si vous ne vous occupez pas d\'une personne malade, vous gaspillez un masque. L\'OMS recommande l\'utilisation rationnelle des masques médicaux pour éviter le gaspillage inutile de ressources précieuses et la mauvaise utilisation des masques. Les moyens les plus efficaces de se protéger et de protéger les autres contre COVID-19 sont de se nettoyer fréquemment les mains, de se couvrir la toux avec le coude ou un mouchoir en papier et de maintenir une distance d\'au moins 1 mètre des personnes qui toussent ou éternuent.'
    },
    {
      'question':
          'Les antibiotiques sont-ils efficaces pour prévenir ou traiter la COVID-19 ?',
      'answer':
          'Non. Les antibiotiques ne sont pas efficaces contre les virus, ils n\'agissent que sur les infections bactériennes. La COVID-19 est causée par un virus, les antibiotiques n\'agissent donc pas. Les antibiotiques ne doivent pas être utilisés comme moyen de prévention ou de traitement de la COVID-19. Ils ne doivent être utilisés que selon les instructions d\'un médecin pour traiter une infection bactérienne. '
    }
  ];
}
