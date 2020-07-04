(**EN**|[FR])
# cesi_covid_19_tracker
[![version_badge](https://img.shields.io/badge/version-1.7.1-informational)][Release]

||status|
|:---:|:---:|
| **release** build |[![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7368db767d62001922585d/latest_build)|
| **dev** build |[![Codemagic build status](https://api.codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/status_badge.svg)](https://codemagic.io/apps/5e7368db767d62001922585e/5e7371412ab6bb0019392b67/latest_build)|
| Unit tests |[![coverage](https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/coverage/covbadge.svg)](https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master/coverage)|

_(The **release** build only indicates the success or failure of a ```flutter build web --release``` command on the latest [Release], while the **dev** build triggers execution of the whole test suite)_

**Welcome** on the repository for the *CORONED* app !:smile::fire:
# Presentation
### What is this repo for exactly ?? :raised_eyebrow:
You'll find here the source code for a simple app written in **[Flutter]** whose humble purpose is to provide **informations** on the **COVID-19** world situation along with a short **FAQ** about this virus.

This application has first been created by a group of 4 students in software engineering during a course on Web development !:rocket:
We had 2 school days to think about a simple website to build...subject and technologies free of choice !! The notation was about project management not coding so.. We could have fun with the app !:+1: We chose Flutter Web so we can get a first glimpse on this technology and we chose to make a simple **COVID-19** dashboard relying on some free API.

After what became a sucessful exam, I chose to continue the development for training purposes! And also to see the state of Flutter for Web...:thinking:

_Let's dive in !!_:monocle_face:
### Features :rocket:
- Home page with world stats ([Dashboard])
- Countries page with list of all available countries ([CountryView])
  * A text input enables instant filtering on the list
  * Clicking on one entry will open a new page with the country detailed stats
- Country details page with **COVID-19** related statistics ([DetailsPage])
- About page with licences used in this project and a link to this page (forked from Flutter's [LicencePage] :rocket:)
### Data sources :nerd_face:
This app relies on **3** data sources:
- Static FAQ hardcoded in ```FAQDataSource``` class ([lib/shared/constants/app_globals.dart])
- List of countries and their infos via [restcountries.eu] API
- **COVID-19** stats by country and for the world via [NOVELCovid] API which in turns rely on these [sources]

### What I have learned :exploding_head:
Since this is a repo created for studies, I will explain in this section what I've learned or trained during the development of this Flutter website:
- Responsivity (Layout **had** to react to screen size on a platform like web)
- Network request handling using [http]
- Error handling (if a 404 occurs on [NOVELCovid] API, that means the country hasn't reported any cases or the API has not any infos available, so I had to create a custom Exception class to handle this case and adapt softly the UI and improve UX. I also handle unknown errors and display an ugly red on black msg so user knows something rly bad happened :smile:)
- JSON<->Object manipulations (made a lot easier thanks to [freezed] :rocket:)
- Unit testing (see **[test]** folder for source code)
- Performance optimization (Flutter for web is capricious sometimes :sweat_smile:)
- Github project management tools (in the begining we were 4 students, and chose to go with Automated Kanban boards from Github ! Issues and PR were our way to handle the development of the website, and I continue on in order to better learn about all Github features :rocket:)
### Screenshots: :mag:
_// **TODO**: Put screenshots here when V2 is done_
- Mobile:

| Page  | UI    |
| :---: | :---: |
| [Dashboard] | **TODO** |
| [CountryView] | **TODO** |
| [DetailsPage] | **TODO** |
| [FAQ] | **TODO** |

- Desktop:

| Page  | UI    |
| :---: | :---: |
| [Dashboard] | **TODO** |
| [CountryView] | **TODO** |
| [DetailsPage] | **TODO** |
| [FAQ] | **TODO** |
### Changelog :clipboard:
See [Release] section
### Built with :hammer_and_wrench:
_Direct dependencies:_
* [Flutter] - The Google framework based on Dart used to build this application
* [http] - The package used to make HTTP requests
* [get_it] - The package used for example to register singletons (like the classes that enable calling the covid-19 API)
* [json_serializable] - The package used to facilitate json serialization
* [provider] - The package used to facilitate "State Management" on the application
* [responsive_builder] - The package used to facilitate building of screen responsive UIs
* [freezed] - The package used to generate objects used as DTOs for instance
* [intl] - The package used in this project to format large numbers. It can be used for a lot of other interestings things...
* [flutter_modular] - The package to help structure a flutter project and that gives awesome features such as dynamic route linking (deep linking) :rocket:

_Test & Dev Dependencies:_
* [flutter_test] - The Flutter library used to implement unit tests
* [flutter_driver] - The Flutter library used to set up automated integration tests
* [build_runner] - The Flutter tool used to generate code and reduce developers charge
# Run it on localhost
If checking it [online](https://rcdevril.github.io/cesi_covid_19_tracker/) is not your cup of tea, you can also try launching the app on your local device. The app is compiled on every release and you can find archives of website and apks on the [Release] page. You can also build it yourself using [Flutter] CLI.

_/!\ This app was developed on Web platform using [Flutter]'s  `beta` channel so make sure you have a compatible version before trying to compile and run it /!\\_

In order to switch to beta channel, you have to execute these 2 commands:

- `flutter channel beta`
- `flutter upgrade`

Enabling web beta is done by these:

* `flutter config --enable-web`
* `flutter upgrade`
### Launching the Application :rocket:
If you want to launch the Web version, you can do it using the command:

`flutter run -d [chrome|web-server]`

_The chrome option will only be available if you have this browser installed on the local machine. The web-server option therefore launches a web server on which any browser can attempt to connect._

To start the build, install, and run process on an Android or iOS device, run the following command:

`flutter run`

This will install and run the app on the connected device. Although, be aware that we almost never test Android/iOS releases by actually running them. If build is passing, it's enough for us. Anyway the app is really simple, so there shouldn't be any problems !

_If you have a real device, just connect it to the computer using your USB cable. The Flutter plugin should notice the device and automatically add it to the list._
### Building the Application :building_construction:
These steps are done on each [Release] and artifacts are shared in `.zip` files.
To start building the release `.apk` files found in the [Release] page, consider using this command:

`flutter build apk --release --split-per-abi`

This command will produce multiple apks in the `/build/app/outputs/apk/release/` folder in your local repository. Choose the one that best matches the architecture of your device.

To start building the release version of the website, consider using this command:

`flutter build web --release`

This command will produce the compiled website in the `/build/web/` folder of your local repository.
### Launch of unit tests :heavy_check_mark:
_This paragraph explains how to trigger the tests written in the **[test]** folder of this repository._

To launch unit tests, you must execute this command:

`flutter test`

This will trigger the execution of unit tests. The results will finally be printed on your console.
You can also use your IDE integrated test report tool. According to the IDE, you should see the results quite easily.

# Contributing

To contribute, please check out the [Issues] list, ask how you can help and click on this PR button!:rocket::+1:

### Contributors :blue_heart:

Thanks a lot for your contributions !!:smile::rocket:
|[CodeSadhu]|
|:---:|
|![CodeSadhu's profile pic](https://avatars1.githubusercontent.com/u/11538660?s=400&u=a8d9eadb52920602c56cf388899eeb842ccb2f67&v=4)|
|*__First__ Contributor* with PR [#56] fixing issue [#52]|

See also the [contributors] page.
# Authors
|[RcDevRIL]|[BoiteSphinx]|[FerreiraJames]|[Reyden]|
|:---:|:---:|:---:|:---:|
|![RcDevRIL's profile pic](https://avatars0.githubusercontent.com/u/40863686?s=460&u=61529927de8d90b909315f93e45f93623a16a474&v=4)|![BoiteSphinx's profile pic](https://avatars3.githubusercontent.com/u/51713003?s=400&u=b11b748cfe7857fea4862ec828f5681606b6d6d4&v=4)|![FerreiraJames's profile pic](https://avatars3.githubusercontent.com/u/45099726?s=400&v=4)|![Reyden's profile pic](https://avatars3.githubusercontent.com/u/44286667?s=400&v=4)|
# License
This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the file [LICENSE.md] for more details.
# Disclaimer
This Flutter app was developed on Web platform for training purposes as I'm learning through application development with the Flutter Framework. Do not expect high quality UI & code:smile:

I tried to keep the code acceptable but I'm pretty sure there are loads of things that could be done better! That's why we accept kind contributions:rocket:

The web platform has still improvements to be made but the result is far from bad and with some tweaks you are able to adjust performance on scroll, image loading via network etc.:white_check_mark:

I tried to not use too much packages so I can learn to fix issues myself and develop things !:muscle:


Flutter for the win:blue_heart::rocket:

Thanks for reading all the way through!:grin:

Have fun coding !!:rocket::computer:

[Flutter "get started"]: https://flutter.dev/get-started/
[Github root]: https://github.com/RcDevRIL/cesi_covid_19_tracker/
[Built_With]: https://github.com/RcDevRIL/cesi_covid_19_tracker/tree/master#built-with
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
[flutter_modular]: https://pub.dev/packages/flutter_modular
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
[lib/shared/constants/app_globals.dart]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/shared/constants/app_globals.dart#L88
[LicencePage]: https://api.flutter.dev/flutter/material/LicensePage-class.html
[restcountries.eu]: http://restcountries.eu/
[NOVELCovid]: https://corona.lmao.ninja/docs/#/
[sources]: https://github.com/NovelCOVID/API#sources
[CountryView]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/modules/country_module/pages/country_view.dart
[Dashboard]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/modules/main_module/pages/dashboard.dart
[DetailsPage]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/modules/country_module/pages/details_page.dart
[FAQ]: https://github.com/RcDevRIL/cesi_covid_19_tracker/blob/master/lib/ui/modules/main_module/pages/covid_faq.dart
