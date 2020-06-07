([EN]|**FR**)
# cesi_covid_19_tracker
[![version_badge](https://img.shields.io/badge/version-1.5-informational)][Release]

||Statut
|:---:|:---:|
| **release** build |[![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/latest_build)|
| **dev** build |[![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/latest_build)|
| Tests unitaires |[![coverage](https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/coverage/covbadge.svg)](https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master/coverage)|

(Le build **release** indique seulement le succès ou l'échec d'une commande ```flutter build web --release``` sur la dernière [Release], tandis que le build **dev** déclenche l'exécution de toute la suite de tests)

**Bienvenue** sur le dépôt de l'application *CORONED* !:smile::fire:
# Présentation
### A quoi sert exactement ce dépôt ? :raised_eyebrow:
Vous trouverez ici le code source d'une petite application écrite en **[Flutter]** dont l'humble but est de fournir des **informations** sur la situation mondiale **COVID-19** ainsi qu'une courte **FAQ** sur ce virus.

Cette application a d'abord été créée par un groupe de 4 étudiants en génie logiciel lors d'un cours sur le développement Web !:rocket:
Nous avons eu 2 jours d'école pour réfléchir à un simple site web à construire...sujet et technologies au choix !! La notation portait sur la gestion de projet et non sur le codage donc... Nous pouvions nous amuser avec l'application !:+1: Nous avons choisi Flutter Web pour avoir un premier aperçu de cette technologie et nous avons choisi de faire un simple _dashboard_ **COVID-19** s'appuyant sur une API libre.

Après ce qui a été un examen réussi, j'ai choisi de poursuivre le développement à des fins de formation ! Et aussi pour voir l'état d'avancement de Flutter for Web...:thinking:

_Let's dive in !!_:monocle_face:
### Caractéristiques :rocket:
- Page d'accueil avec les statistiques mondiales ([Dashboard])
- Page des pays avec la liste de tous les pays disponibles ([CountryView])
  * Une saisie de texte permet un filtrage instantané sur la liste
  * Cliquer sur une entrée ouvre une nouvelle page avec les statistiques détaillées du pays
- Page de détails sur le pays avec les statistiques liées à **COVID-19** ([DetailsPage])
- Page _About_ avec les licences utilisées dans ce projet (merci à l'équipe Flutter pour [LicencePage]:rocket:)
### Sources de données :nerd_face:
Cette application s'appuie sur **3** sources de données:
- FAQ statique codée en dur dans la classe ```FAQDataSource``` ([lib/data/constants/app_globals.dart])
- Liste des pays et leurs informations via l'API [restcountries.eu].
- Statistiques **COVID-19** par pays et pour le monde entier via l'API [NOVELCovid] qui s'appuie à son tour sur ces [sources].

### Ce que j'ai appris :exploding_head:
Comme il s'agit d'un repo créé pour les études, je vais expliquer dans cette section ce que j'ai appris ou retravaillé pendant le développement de ce site Flutter :
- _Responsivity_ (la mise en page **devait** réagir à la taille de l'écran sur une plate-forme comme le web)
- Traitement des requêtes réseau par [http].
- Gestion des erreurs (si un 404 se produit sur l'API [NOVELCovid], cela signifie que le pays n'a pas signalé de cas ou que l'API n'a pas d'informations disponibles, j'ai donc dû créer une classe d'exception personnalisée pour traiter ce cas et adapter l'interface utilisateur afin améliorer l'interface utilisateur. Je gère également les erreurs inconnues et j'affiche un vilain msg rouge sur fond noir pour que l'utilisateur sache que quelque chose de grave est arrivé:smile:)
- JSON<->Manipulations d'objets (rendues beaucoup plus faciles grâce à [freezed]:rocket:)
- Tests unitaires (voir le dossier **[test]** pour le code source)
- Optimisation des performances (Flutter est parfois capricieux pour le web:sweat_smile:)
- Outils de gestion de projet Github (au début, nous étions 4 étudiants, et nous avons choisi d'utiliser les planches Automated Kanban de Github ! Les problèmes et les relations publiques ont été notre façon de gérer le développement du site web, et je continue à mieux connaître toutes les fonctionnalités de Github:rocket:)
### Captures d'écran :mag:
_// **TODO** : Mettez des captures d'écran ici quand la V2 sera terminée_
- Mobile :

| Page | UI |
| :---: | :---: |
| [Dashboard] | **TODO** |
| [CountryView] | **TODO** |
| [DetailsPage] | **TODO** |
| [FAQ] | **TODO** |
- Bureau :

| Page | UI |
| :---: | :---: |
| [Dashboard] | **TODO** |
| [CountryView] | **TODO** |
| [DetailsPage] | **TODO** |
| [FAQ] | **TODO** |
### Changelog :clipboard:
Voir la section [Release].
### _Built with_ :hammer_and_wrench:
_Dépendances directes :_
* [Flutter] - Le framework Google basé sur Dart utilisé pour construire cette application
* [http] - Le paquet utilisé pour faire des requêtes HTTP
* [get_it] - Le paquet utilisé par exemple pour enregistrer des singletons (comme les classes permettant l'appel à l'API covid-19)
* [json_serializable] - Le paquet utilisé pour faciliter la (dé)sérialisation de _payload_ JSON
* [provider] - Le paquet utilisé pour faciliter le "_state management_" sur l'application
* [responsive_builder] - Le paquet utilisé pour faciliter le développement d'interfaces utilisateur sensibles à la taille de l'écran
* [freezed] - Le paquet utilisé pour générer des objets utilisés comme DTO par exemple
* [intl] - Le paquet utilisé dans ce projet pour formater les grands nombres. Il peut être utilisé pour beaucoup d'autres choses intéressantes...

_Dépendances de test et de développement :_
* [flutter_test] - La bibliothèque Flutter utilisée pour implémenter les tests unitaires
* [flutter_driver] - La bibliothèque Flutter utilisée pour mettre en place des tests d'intégration automatisés
* [build_runner] - L'outil Flutter utilisé pour générer du code et réduire la charge des développeurs
# Lancement sur localhost
Si la consultation [en ligne] (https://rcdevril.github.io/cesi_covid_19_tracker/) n'est pas votre tasse de thé, vous pouvez également essayer de lancer l'application en local. L'application est compilée à chaque lancement et vous pouvez trouver les archives des sites web et des apks sur la page [Release]. Vous pouvez également la créer vous-même en utilisant le CLI [Flutter].

_/!\ Cette application a été développée sur la plateforme Web utilisant le canal `bêta` de [Flutter], donc assurez-vous d'avoir une version compatible avant d'essayer de la compiler et de l'exécuter. /!\\_

Pour passer au canal bêta, vous devez exécuter ces 2 commandes :

- `flutter canal beta`
- `flutter upgrade`

Activer la beta web se fait de grâce à ces 2 commandes :

* `flutter config --enable-web`
* `flutter upgrade`
### Lancement de l'application :rocket:
Si vous souhaitez lancer la version Web, vous pouvez le faire à l'aide de la commande

`flutter run -d [chrome|web-server]`

L'option chrome ne sera disponible que si vous avez installé ce navigateur sur la machine locale. L'option serveur web lance donc un serveur web sur lequel n'importe quel navigateur peut tenter de se connecter._

Pour lancer le processus de compilation, d'installation et d'exécution sur un appareil Android ou iOS, exécutez la commande suivante :

`flutter run`

Cela permettra d'installer et d'exécuter l'application sur l'appareil connecté. Cependant, sachez que nous ne testons presque jamais les releases Android/iOS en les lançant: si la compilation est réussie, cela nous suffit. De toute façon, l'application est très simple, donc il ne devrait pas y avoir de problèmes !

_Si vous avez un vrai appareil, il suffit de le connecter à l'ordinateur avec votre câble USB. Le plugin Flutter devrait remarquer le périphérique et l'ajouter automatiquement à la liste._
### Construction de l'application :building_construction:
Ces étapes sont effectuées à chaque [Release] et les artefacts sont partagés dans des fichiers `.zip`.
Pour commencer à compiler les fichiers `.apk` de la version qui se trouvent dans la page [Release], pensez à utiliser cette commande :

`flutter build apk --release --split-per-abi`

Cette commande va produire plusieurs apks dans le dossier `/build/app/outputs/apk/release/` de votre dépôt local. Choisissez celui qui correspond le mieux à l'architecture de votre appareil.

Pour commencer à compiler la version du site web, envisagez d'utiliser cette commande :

`flutter build web --release`

Cette commande produira le site web compilé dans le dossier `/build/web/` de votre dépôt local.
### Lancement des tests unitaires :heavy_check_mark:
_Ce paragraphe explique comment déclencher les tests implémentés dans le dossier **[test]** de ce dépôt._

Pour lancer les tests unitaires, vous devez exécuter cette commande :

`flutter test`

Cela déclenchera l'exécution de tous les tests unitaires. Les résultats seront finalement loggés sur votre console.
Vous pouvez également utiliser votre outil de rapport de test intégré à l'IDE. Selon l'IDE, vous devriez voir les résultats assez facilement.
# Contribuer
Pour contribuer, veuillez consulter la liste des [Issues], demander comment vous pouvez aider et cliquer sur ce bouton de relations publiques !:rocket::+1:
### Contributeurs :blue_heart:
Merci beaucoup pour vos contributions !!:smile::rocket:
|[CodeSadhu]|
|:---:|
| ![photo du profil de CodeSadhu](https://avatars1.githubusercontent.com/u/11538660?s=400&u=a8d9eadb52920602c56cf388899eeb842ccb2f67&v=4)]|
|*Premier contributeur* avec PR [#56] corrigeant le problème [#52]|

Voir aussi la page [contributors].
# Auteurs
|[RcDevRIL]|[BoiteSphinx]|[FerreiraJames]|[Reyden]|
|:---:|:---:|:---:|:---:|
| ![photo du profil de RcDevRIL](https://avatars0.githubusercontent.com/u/40863686?s=460&u=61529927de8d90b909315f93e45f93623a16a474&v=4)| ![photo du profil de BoiteSphinx](https://avatars3.githubusercontent.com/u/51713003?s=400&u=b11b748cfe7857fea4862ec828f5681606b6d6d4&v=4)| ![photo du profil de FerreiraJames](https://avatars3.githubusercontent.com/u/45099726?s=400&v=4)| ![photo du profil de Reyden](https://avatars3.githubusercontent.com/u/44286667?s=400&v=4)|
# Licence
Ce projet est sous licence GNU GENERAL PUBLIC LICENSE - voir le fichier [LICENSE.md] pour plus de détails.
# Disclaimer
Cette application Flutter a été développée sur la version Web à des fins de formation, car j'apprends en développant des applications avec le framework Flutter. Ne vous attendez pas à une UI et un code de haute de qualité:smile:

J'ai essayé de garder le code acceptable mais je suis presque sûr qu'il y a beaucoup de choses qui pourraient être mieux faites ! C'est pourquoi nous acceptons les contributions avec plaisir:rocket:

La plateforme web a encore besoin de quelques améliorations mais le résultat est loin d'être mauvais et avec quelques ajustements, vous pouvez améliorer les performances sur le scroll, le chargement d'images via le réseau etc.:white_check_mark:

J'ai essayé de ne pas utiliser trop de paquets externes afin d'apprendre à résoudre les problèmes moi-même et de développer des choses !:muscle:

_Flutter for the win_:blue_heart::rocket:

Merci pour votre lecture !:grin:

Amusez-vous bien à coder !!:rocket::computer:

[Flutter "get started"]: https://flutter.dev/get-started/
[Github root]: https://github.com/RcDevRIL/cesi_covid_19_tracker/
[Built_With]: https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master#dépendances
[test]: https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master/test
[test_driver]: https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master/test_driver
[Flutter]: https://github.com/flutter/flutter/
[http]: https://pub.dev/packages/http
[get_it]: https://pub.dev/packages/get_it
[json_serializable]: https://pub.dev/packages/json_serializable
[provider]: https://pub.dev/packages/provider
[responsive_builder]: https://pub.dev/packages/responsive_builder
[freezed]: https://pub.dev/packages/freezed
[intl]: https://pub.dev/packages/intl
[flutter_test]: https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html
[build_runner]: https://pub.dev/packages/build_runner
[flutter_driver]: https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html
[RcDevRIL]: https://github.com/RcDevRIL
[BoiteSphinx]: https://github.com/BoiteSphinx
[FerreiraJames]: https://github.com/FerreiraJames
[Reyden]: https://github.com/Reyden7
[contributors]: https://github.com/RcDevRIL/cesi_covid_19_tracker/contributors
[CodeSadhu]: https://github.com/CodeSadhu
[#52]: https://github.com/RcDevRIL/cesi_covid_19_tracker/issues/52
[#56]: https://github.com/RcDevRIL/cesi_covid_19_tracker/pull/56
[LICENSE.md]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/LICENSE
[Issues]: https://github.com/RcDevRIL/cesi_covid_19_tracker/issues
[Release]: https://github.com/RcDevRIL/cesi_covid_19_tracker/releases
[EN]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/README.md
[FR]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/README-fr.md
[lib/data/constants/app_globals.dart]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/dev-readme/lib/data/constants/app_globals.dart#L88
[LicencePage]: https://api.flutter.dev/flutter/material/LicensePage-class.html
[restcountries.eu]: http://restcountries.eu/
[NOVELCovid]: https://corona.lmao.ninja/docs/#/
[sources]: https://github.com/NovelCOVID/API#sources
[CountryView]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/ui/pages/country_view.dart
[Dashboard]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/ui/pages/dashboard.dart
[DetailsPage]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/ui/pages/details_page.dart
[FAQ]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/ui/pages/covid_faq.dart