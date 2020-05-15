# cesi_covid_19_tracker (English version)
__Build status__
* master: [![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/latest_build)
* integration: [![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/latest_build)


Welcome to the development directory for our mini-project done during an advanced web development study lesson!

In this README you will find useful information on this project.

*Distributed by CESI RIL B2 - 2018-2020*

## Presentation

This project consists of an information service on the state of the COVID-19 pandemic currently raging around the world.

The first version consists of an info list linked to the country selected by the user.

After what became a successful exam, we want the application to grow and **welcome** contributions! :fire:

_V2 coming soon !_ :rocket:

### Changelog

See [Release] section

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

## Dependencies

_Direct dependencies: _
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
[flutter_driver]: https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html
[RcDevRIL]: https://github.com/RcDevRIL
[BoiteSphinx]: https://github.com/BoiteSphinx
[FerreiraJames]: https://github.com/FerreiraJames
[Reyden]: https://github.com/Reyden7
[contributors]: https://github.com/RcDevRIL/cesi_covid_19_tracker/contributors
[LICENSE.md]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/LICENSE
[Issues]: https://github.com/RcDevRIL/cesi_covid_19_tracker/issues
[Release]: https://github.com/RcDevRIL/cesi_covid_19_tracker/releases
