import 'dart:developer' as dd;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_modular/flutter_modular.dart' show Consumer, Modular;

import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show AppConstants, CoronedAppBar, NavigationDrawer, SizeBreakpoint;
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;

/// RcDevRIL: FORKED FROM FLUTTER FRAMEWORK (channel: beta , release: 1.19.0-4.2.pre)
/// ---------------------------------------
///  Copyright 2014 The Flutter Authors. All rights reserved.
/// Use of this source code is governed by a BSD-style license that can be
/// found in the LICENSE file.
///
/// A page that shows licenses for software used by the application.
///
/// To show a [LicensePage], use [showLicensePage].
///
/// The [AboutDialog] shown by [showAboutDialog] and [AboutListTile] includes
/// a button that calls [showLicensePage].
///
/// The licenses shown on the [LicensePage] are those returned by the
/// [LicenseRegistry] API, which can be used to add more licenses to the list.
class AboutPage extends StatefulWidget {
  /// Creates a page that shows licenses for software used by the application.
  ///
  /// The arguments are all optional. The application name, if omitted, will be
  /// derived from the nearest [Title] widget. The version and legalese values
  /// default to the empty string.
  ///
  /// The licenses shown on the [LicensePage] are those returned by the
  /// [LicenseRegistry] API, which can be used to add more licenses to the list.
  const AboutPage({
    Key key,
    this.applicationName,
    this.applicationVersion,
    this.applicationIcon,
    this.applicationLegalese,
  }) : super(key: key);

  /// The name of the application.
  ///
  /// Defaults to the value of [Title.title], if a [Title] widget can be found.
  /// Otherwise, defaults to [Platform.resolvedExecutable].
  final String applicationName;

  /// The version of this build of the application.
  ///
  /// This string is shown under the application name.
  ///
  /// Defaults to the empty string.
  final String applicationVersion;

  /// The icon to show below the application name.
  ///
  /// By default no icon is shown.
  ///
  /// Typically this will be an [ImageIcon] widget. It should honor the
  /// [IconTheme]'s [IconThemeData.size].
  final Widget applicationIcon;

  /// A string to show in small print.
  ///
  /// Typically this is a copyright notice.
  ///
  /// Defaults to the empty string.
  final List<String> applicationLegalese;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  GestureRecognizer _linkHandler;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (!Modular.get<CoronedData>().isScrollToTopShown &&
          _scrollController.offset > AppConstants.scrollToTopTreshold) {
        _showOverlay(context);
      }
      if (Modular.get<CoronedData>().isScrollToTopShown &&
          _scrollController.offset < AppConstants.scrollToTopTreshold) {
        Modular.get<CoronedData>().removeScrollToTopButton();
      }
    });
    _linkHandler = TapGestureRecognizer()
      ..onTap =
          () => locator.get<AppUtils>().openLink(AppConstants.repositoryUrl);
    _initLicenses();
  }

  @override
  void dispose() {
    _linkHandler?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  _showOverlay(BuildContext context) {
    final scrollToTopButton = AppConstants.buildScrollToTopButton(
      () => _scrollController.animateTo(
        0.0,
        duration: Duration(
            milliseconds: _scrollController.offset / 3 >
                    AppConstants.maxScrollToTopDuration
                ? AppConstants.maxScrollToTopDuration
                : (_scrollController.offset / 3).floor()),
        curve: Curves.ease,
      ),
    );
    Modular.get<CoronedData>()
        .showScrollToTopButton(context, scrollToTopButton);
  }

  final List<Widget> _licenses = <Widget>[];
  bool _loaded = false;

  Future<void> _initLicenses() async {
    int debugFlowId = -1;
    assert(() {
      final dd.Flow flow = dd.Flow.begin();
      dd.Timeline.timeSync('_initLicenses()', () {}, flow: flow);
      debugFlowId = flow.id;
      return true;
    }());
    await for (final LicenseEntry license in LicenseRegistry.licenses) {
      if (!mounted) {
        return;
      }
      assert(() {
        dd.Timeline.timeSync('_initLicenses()', () {},
            flow: dd.Flow.step(debugFlowId));
        return true;
      }());
      final List<LicenseParagraph> paragraphs =
          await SchedulerBinding.instance.scheduleTask<List<LicenseParagraph>>(
        license.paragraphs.toList,
        Priority.animation,
        debugLabel: 'License',
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _licenses.add(const Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          child: Text(
            '🍀‬', // That's U+1F340. Could also use U+2766 (❦) if U+1F340 doesn't work everywhere.
            textAlign: TextAlign.center,
          ),
        ));
        _licenses.add(Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.0))),
          child: Text(
            license.packages.join(', '),
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ));
        for (final LicenseParagraph paragraph in paragraphs) {
          if (paragraph.indent == LicenseParagraph.centeredIndent) {
            _licenses.add(Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                paragraph.text,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ));
          } else {
            assert(paragraph.indent >= 0);
            _licenses.add(Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 8.0, start: 16.0 * paragraph.indent),
              child: Text(paragraph.text),
            ));
          }
        }
      });
    }
    setState(() {
      _loaded = true;
    });
    assert(() {
      dd.Timeline.timeSync('Build scheduled', () {},
          flow: dd.Flow.end(debugFlowId));
      return true;
    }());
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final String name = widget.applicationName ?? 'CORONED';
    final String version = widget.applicationVersion ?? 'v2.0.0';
    final Widget icon = widget.applicationIcon ?? Text('defaultIcon');
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: CoronedAppBar(
        isMobile: context.isMobile,
        isWatch: context.isWatch,
        textStyle: Theme.of(context).textTheme.headline1,
      ),
      body: Consumer<CoronedData>(builder: (_, cD) {
        if (!cD.isLoaded) {
          return Center(child: CircularProgressIndicator());
        } else {
          var applicationLegalese = [
            cD.appTextTranslations?.appDesc1,
            cD.appTextTranslations?.appDesc2,
            cD.appTextTranslations?.appDesc3,
            cD.appTextTranslations?.appDesc4,
            cD.appTextTranslations?.appDesc5,
          ];
          return DefaultTextStyle(
            style: Theme.of(context).textTheme.caption,
            child: SafeArea(
              bottom: false,
              child: Scrollbar(
                child: ListView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                  children: <Widget>[
                    Text(name,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center),
                    if (icon != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: IconTheme(
                            data: Theme.of(context).iconTheme, child: icon),
                      ),
                    Text(version,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    Container(height: 18.0),
                    ...applicationLegalese.map((s) {
                      Widget text;
                      if (s.contains('github.com')) {
                        text = RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: s.substring(0, s.indexOf('g')),
                            style: Theme.of(context).textTheme.caption,
                            children: <InlineSpan>[
                              TextSpan(
                                text: s.substring(s.indexOf('g'), s.length - 2),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                        color: const Color(0xFF1A0DAB),
                                        decoration: TextDecoration.underline),
                                recognizer: _linkHandler,
                              ),
                              TextSpan(
                                text: s.substring(s.length - 2),
                              ),
                            ],
                          ),
                        );
                      } else {
                        text = Text(
                          s,
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.center,
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                          !(context.isMobile || context.isWatch)
                              ? MediaQuery.of(context).size.width / 4
                              : 0,
                          0.0,
                          !(context.isMobile || context.isWatch)
                              ? MediaQuery.of(context).size.width / 4
                              : 0,
                          18.0,
                        ),
                        child: text,
                      );
                    }).toList(),
                    Container(height: 18.0),
                    Text('Powered by Flutter',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center),
                    Container(height: 24.0),
                    ..._licenses,
                    if (!_loaded)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
