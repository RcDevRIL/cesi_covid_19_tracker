# cesi_covid_19_tracker
__Build status__
* master: [![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/latest_build)
* integration: [![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/latest_build)


Bienvenue sur le répertoire de développement pour notre mini-projet en cours de développement web avancé !

Vous trouverez dans ce README les infos utiles sur ce projet.

*Distributed by CESI RIL B2 - 2018-2020*

## Présentation

Ce projet consiste en un service d'information sur l'état de la pandémie liée au COVID-19 qui sévit actuellement dans le monde.

La première version consistera en une liste d'info liée au pays sélectionné par l'utilisateur.

Après un examen couronné de succès, l'application continue de grandir et nous accueillons avec **plaisir** les contributions! :fire:

_À bientôt la V2 !_ :rocket:

### Changelog

Voir section [Release]

##### Prérequis

De quoi avez-vous besoin pour installer ce projet et le lancer en mode "debug"

* D'abord, il vous faudra une copie de ce dépôt Git: utilisez la fonctionnalité "Download" de [cette][Github root] page ou utilisez le CLI de Git si il est installé sur votre ordinateur :
    * `git clone https://github.com/RcDevRIL/cesi_covid_19_tracker.git`

* Ensuite il faut installer le SDK de Flutter pour pouvoir utiliser son CLI et lancer l'application en mode debug (ou release). Vous pouvez suivre le [Flutter "get started"] guide.


Si vous êtes passé par toutes les étapes du tutoriel [flutter.dev][Flutter "get started"] vous devriez avoir votre éditeur de code favori prêt au développement sous Flutter!

## Lancement de l'application

Avant de vouloir lancer l'application, assurez-vous d'obtenir les paquets que nous avons choisis pour [construire][Built_With] notre application. Pour ce faire, vous devez exécuter ces commandes:

* `flutter pub upgrade`
* `flutter pub get`

Vous pouvez maintenant envisager de créer et d'exécuter l'application :upside_down_face:

Pour lancer le processus de construction, d'installation et d'exécution sur un appareil Android ou iOS, exécutez la commande suivante:

`flutter run`

Cela permettra d'installer l'application sur l'appareil connecté et de l'exécuter.

_Si vous avez un vrai appareil, il suffit de le brancher à l'ordinateur à l'aide de votre câble USB. Le plugin Flutter devrait remarquer le dispositif et l'ajouter automatiquement à la liste._

Si vous souhaitez utiliser la version Web, assurez vous de l'avoir activé sur votre environnement Flutter:

* `flutter config --enable-web`
* `flutter upgrade`

Et préférez le canal beta:

`flutter channel beta`

*(bien que Flutter __v1.17.1__ devrait suffire!!)*

Une fois que le switch s'est effectué, vous pourrez lancer la version web de l'application grâce à la commande:

`flutter run -d [chrome|web-server]`

_L'option chrome sera seulement disponible si vous avez ce navigateur d'installé sur la machine locale. L'option web-server lance donc un serveur web sur lequel n'importe quel navigateur peut tenter la connexion._

Pour commencer à construire le fichier release .apk, pensez à utiliser cette commande :

`flutter build apk --split-per-abi`

Cette commande produira plusieurs apks dans le dossier `/build/app/outputs/apk/release/` de votre dépôt local. Choisissez celle qui correspond le mieux à l'architecture de votre appareil. 

Pour commencer à construire le site web en mode RELEASE, pensez à utiliser cette commande :

`flutter build web --release`

Cette commande produira le site web compilé dans le dossier `/build/web/` de votre dépôt local.

## Lancement des tests unitaires

_Ce paragraphe explique comment déclencher les tests écrits dans le dossier **[test]** de ce dépôt._

Pour lancer les tests unitaires, il faut exécuter cette commande :

`flutter test`

Cela déclenchera l'exécution de tests. Les résultats seront finalement imprimés sur votre console.
Vous pouvez également utiliser votre outil de rapport de test intégré à l'IDE. Selon l'IDE, vous devriez voir les résultats assez facilement.

## Lancement des tests d'intégrations

_Ce paragraphe explique comment déclencher les tests écrits dans le dossier **[test_driver]** de ce dépôt._

Pour lancer des tests d'intégration automatisés, assurez-vous que vous avez un appareil Android connecté et exécutez cette commande :

`flutter drive --target=test_driver/coroned_app.dart`

Cela déclenchera l'exécution des tests d'intégration automatisés. Il lancera l'application en mode débogage et exécutera les actions mises en œuvre. Cet outil est idéal pour permettre l'intégration stable des nouvelles versions :rocket:

Mais pour l'instant, les tests mis en œuvre sont à des fins de démonstration.

## Dépendances

_Dépendances Directes :_
* [Flutter] - Le framework Google basé sur Dart utilisé pour construire cette application
* [http] - Le paquet utilisé pour effectuer des requêtes HTTP
* [get_it] - Le paquet utilisé par exemple pour enregistrer des services (comme celui d'appel à l'API covid-19)
* [json_serializable] - Le paquet utilisé pour faciliter la (dé)sérialisation json
* [provider] - Le paquet utilisé pour facilité le "State Management" de l'application
* [responsive_builder] - Le paquet utilisé pour facilité la construction d'UI suivant la taille de l'écran
* [freezed] - Le paquet utilisé pour générer des objets par exemple utilisé en tant que DTO
* [intl] - Le paquet utilisé dans ce projet pour espacer les chiffres des grands nombres. Ce paquet permet de faire bien d'autres choses intéressantes...

_Test Dependencies:_
* [flutter_test] - La bibliothèque Flutter utilisée pour mettre en œuvre les tests unitaires
* [flutter_driver] - La bibliothèque Flutter utilisée pour mettre en place des tests d'intégration automatisés

## Contributing

Pour contribuer, veuillez envoyer un courriel à l'un des auteurs... ou regardez la liste des [Issues] cliquez sur ce bouton de PR ! :rocket: :smile:

## Authors

* **Romain** - *Main Author* - [RcDevRIL]
* **David** - *Main Author* - [BoiteSphinx]
* **James** - *Main Author* - [FerreiraJames]
* **Quentin** - *Main Author* - [Reyden]

Voir aussi la liste des [contributeurs] qui ont participé à ce projet.

## License

Ce projet est sous licence GNU GENERAL PUBLIC LICENSE - voir le fichier [LICENSE.md] pour plus de détails.


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
[flutter_driver]: https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html
[RcDevRIL]: https://github.com/RcDevRIL
[BoiteSphinx]: https://github.com/BoiteSphinx
[FerreiraJames]: https://github.com/FerreiraJames
[Reyden]: https://github.com/Reyden7
[contributeurs]: https://github.com/RcDevRIL/cesi_covid_19_tracker/contributors
[LICENSE.md]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/LICENSE
[Issues]: https://github.com/RcDevRIL/cesi_covid_19_tracker/issues
[Release]: https://github.com/RcDevRIL/cesi_covid_19_tracker/releases
