# cesi_covid_19_tracker - [![version_badge](https://img.shields.io/badge/version-1.5-informational)](https://github.com/RcDevRIL/cesi_covid_19_tracker/releases)
(**EN**|[FR])

_Project health:_

- **release** build [![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/latest_build)
- **dev** build [![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/latest_build)
- **Unit tests** ![coverage](https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/coverage/covbadge.svg)

_(The **release** build only indicates the success or failure of a ```flutter build web --release``` command on the latest [Release], while the **dev** build triggers execution of the whole test suite)_

**Welcome** on the repository for the *CORONED* app !:smile::fire:
# Presentation
### What is this repo for exactly ?? :raised_eyebrow:
You'll find here the source code for a simple app written in **[Flutter]** whose humble purpose is to provide **informations** on the **COVID-19** world situation along with a short **FAQ** about this virus.

This application has first been created by a group of 4 students in software engineering during a course on Web development !:rocket:
We had 2 school days to think about a simple website to build, subject and technologies free of choice !! The notation was about project management not coding so.. We could have fun with the app !:+1: We chose Flutter Web so we can get a first glimpse on this technology and we chose to make a simple **COVID-19** dashboard relying on some free API.

After what became a sucessful exam, I chose to continue the development for training purposes! And also to see the state of Flutte for Web...:thinking:

Let's dive in!! :rocket:
### Features :monocle_face:
- Home page with world stats ([Dashboard])
- Countries page with list of all available countries ([CountryView])
  * A text input enables instant filtering on the list
  * Clicking on one entry will open a new page with the country detailed stats
- Country details page with **COVID-19** related statistics ([DetailsPage])
- About page with licences used in this project (thanks Flutter team for [LicencePage] :rocket:)
### Data sources :nerd_face:
This app relies on **3** data sources:
- Static FAQ hardcoded in ```FAQDataSource``` class ([lib/data/constants/app_globals.dart])
- List of countries and their infos via [restcountries.eu] API
- **COVID-19** stats by country and for the world via [NOVELCovid] API which in turns rely on these [sources]

# What I have learned :exploding_head:
Since this is a repo created for studies, I will explain in this section what I've learned or trained during the development of this Flutter website:
- _**TODO**_
# Changelog :clipboard:
See [Release] section
# Built with :hammer_and_wrench:
_Direct dependencies:_
* [Flutter] - The Google framework based on Dart used to build this application
* [http] - The package used to make HTTP requests
* [get_it] - The package used for example to register services (like the call to the covid-19 API)
* [json_serializable] - The package used to facilitate json serialization
* [provider] - The package used to facilitate "State Management" on the application
* [responsive_builder] - The package used to facilitate building of screen responsive UIs
* [freezed] - The package used to generate objects used as DTOs for instance
* [intl] - The package used in this project to format large numbers. It can be used for a lot of other interestings things...

_Test Dependencies:_
* [flutter_test] - The Flutter library used to implement unit tests
* [flutter_driver] - The Flutter library used to set up automated integration tests
# Run it on localhost 
##### Prerequisites
What do you need to install this project and launch it in "debug" mode

* First, you will need a copy of this Git repository: use the "Download" functionality on [this][Github root] page or use the Git CLI if it is installed on your computer:
    * `git clone https://github.com/RcDevRIL/cesi_covid_19_tracker.git`

* Then you have to install the Flutter SDK to be able to use its CLI and launch the application in debug (or release) mode. You can follow the [Flutter "get started"] guide.


If you have gone through all the steps of the tutorial [flutter.dev][Flutter "get started"] you should have your favorite code editor ready for development under Flutter!

## Launching the Application

Before you want to launch the application, make sure you get the packages we have chosen to [build][Built_With] our application. To do this, you need to run these commands:

* `flutter pub upgrade`
* `flutter pub get`

We use the Flutter code generator engine ([build_runner]) to reduce redundant code for developers. If you want to browse between commits, you might have conflicting files.
To fix this, you need to run this command:

`flutter packages pub run build_runner build --delete-conflicting-outputs`

You can now consider creating and running the application :upside_down_face:

To start the build, install, and run process on an Android or iOS device, run the following command:

`flutter run`

This will install and run the app on the connected device.

_If you have a real device, just connect it to the computer using your USB cable. The Flutter plugin should notice the device and automatically add it to the list._

If you want to use the Web version, make sure you have it activated on your Flutter environment:

* `flutter config --enable-web`
* `flutter upgrade`

And prefer the beta channel:

`flutter channel beta`

*(although Flutter __v1.17.1__ should be enough!!)*

Once the switch has been made, you can launch the web version of the application using the command:

`flutter run -d [chrome|web-server]`

_The chrome option will only be available if you have this browser installed on the local machine. The web-server option therefore launches a web server on which any browser can attempt to connect._

To start building the release .apk file, consider using this command:

`flutter build apk --split-per-abi`

This command will produce multiple apks in the `/ build / app / outputs / apk / release /` folder in your local repository. Choose the one that best matches the architecture of your device.

To start building the website in RELEASE mode, consider using this command:

`flutter build web --release`

This command will produce the compiled website in the `/ build / web /` folder of your local repository.

## Launch of unit tests

_This paragraph explains how to trigger the tests written in the **[test]** folder of this repository._

To launch unit tests, you must execute this command:

`flutter test`

This will trigger the execution of tests. The results will finally be printed on your console.
You can also use your IDE test report tool. According to the IDE, you should see the results quite easily.

## Launch of integration tests

*This paragraph explains how to trigger the tests written in the **[test_driver]** folder of this repository.*

To run automated integration tests, make sure you have a connected Android device and run this command:

`flutter drive --target=test_driver/coroned_app.dart`

This will trigger the execution of the automated integration tests. It will launch the application in debug mode and execute the actions implemented. This tool is ideal for allowing the stable integration of new versions :rocket:

But for now, the tests implemented are for demonstration purposes.

## Contributing

To contribute, please send an email to one of the authors ... or check out the [Issues] list and click on this PR button! :rocket: :smile:

## Contributors

Thanks a lot for your contributions !! :smile: :rocket:
* **Atharva Patwardhan** - *__First__ Contributor* - [CodeSadhu]

## Authors

* **Romain** - *Main Author* - [RcDevRIL]
* **David** - *Main Author* - [BoiteSphinx]
* **James** - *Main Author* - [FerreiraJames]
* **Quentin** - *Main Author* - [Reyden]

See also the list of [contributors] who participated in this project.

## License

This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the file [LICENSE.md] for more details.


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