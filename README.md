# cesi_covid_19_tracker - README V0.1.0
__Build status__
* [![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/latest_build)


Welcome on our development repository in which you will find a PoC for a tracker on covid-19 situation
  
*Distributed by CESI RIL B2 - 2018-2020*

## Getting Started

This README will guide you through the setup and deployment of this application on a virtual device (or physical if you have one).


##### Prerequisites

What things you need to install and how to install them

* First you will need a copy of this repository: either use "Download" feature on [this][Github root] page, or use Git CLI if you have installed it on your computer:
    * `git clone https://github.com/RcDevRIL/cesi_covid_19_tracker.git`

* Now you need to have the Flutter SDK to use CLI and run the app on device. Please refer to [Flutter "get started"] guide.


If you went through all the steps on [flutter.dev][Flutter "get started"] you should have your favorite editor with plugins installed to connect to your device easily.

## Run app on device

Before wanting to launch the app, make sure to get the packages we chose to [build][Built_With] our app. To do so, you must run these commands:

* `flutter pub upgrade`
* `flutter pub get`

Now you can consider building and running the app :upside_down_face:

To start build-install-run process, execute this command:

`flutter run`

This will install the app on the connected device and run it. 

_If you have a real device, just plug it to the computer using your USB cable. The Flutter plugin should notice the device and will automatically add it on the list._

To start building the release .apk file, consider using this command:

`flutter build apk --split-per-abi`

This command will output several apks in the `/build/app/outputs/apk/release/` folder of your local repository. Choose the one that better fits your device architecture. 

To start building the release website, consider using this command:

`flutter build web --release`

This command will output several apks in the `/build/web/` folder of your local repository.

## Run Unit Tests

_This paragraph explain how to trigger tests written in the **[test]** folder of this repository._

To start unit tests, execute this command:

`flutter test`

This will trigger the execution of tests. Results will be printed on your console in the end.
You may also use your IDE integrated test report tool. Depending on the IDE, you should see the results pretty easily.

## Run Integration Tests

_This paragraph explain how to trigger tests written in the **[test_driver]** folder of this repository._

To start automated integration tests, make sure you have a connected Android device and execute this command:

`flutter drive --target=test_driver/madera_app.dart`

This will trigger the execution of the automated integration tests. It will launch the app on debug mode and execute implemented actions. This tool is great to enable stable integration of new releases :rocket:

But right now, the tests implemented are for demonstration purposes.

## Built With

_Direct Dependencies:_
* [Flutter] - The Google framework based on Dart used to build this app
* [http] - The package used for making HTTP requests
* [get_it] - The package used to encrypt passwords
* [json_serializable] - The packaged used to ease json (de)serialization

_Test Dependencies:_
* [flutter_test] - The Flutter library used to implement unit tests
* [flutter_driver] - The Flutter library used to implement automated integration tests

## Contributing

To contribute please email one of the authors...or hit that PR button!! :rocket: :smile:

## Authors

* **Romain** - *Main Author* - [RcDevRIL]
* **David** - *Main Author* - [BoiteSphinx]
* **James** - *Main Author* - [FerreiraJames]
* **Quentin** - *Main Author* - [Reyden]

See also the list of [contributors] who participated in this project.

## License

This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE.md] file for details


[Flutter "get started"]: https://flutter.dev/get-started/
[Github root]: https://github.com/RcDevRIL/cesi_covid_19_tracker/
[Built_With]: https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master#built-with
[test]: https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master/test
[test_driver]: https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master/test_driver
[Flutter]: https://github.com/flutter/flutter/
[http]: https://pub.dev/packages/http
[get_it]: https://pub.dev/packages/get_it
[json_serializable]: https://pub.dev/packages/json_serializable
[flutter_test]: https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html
[flutter_driver]: https://api.flutter.dev/flutter/flutter_driver/flutter_driver-library.html
[RcDevRIL]: https://github.com/RcDevRIL
[BoiteSphinx]: https://github.com/BoiteSphinx
[contributors]: https://github.com/RcDevRIL/cesi_covid_19_tracker/contributors
[LICENSE.md]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/LICENSE
