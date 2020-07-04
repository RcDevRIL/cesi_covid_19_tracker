import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextCapitalization, TextInputAction;
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show CoronedData;
import 'package:cesi_covid_19_tracker/shared/widgets/widgets.dart'
    show CoronedAppBar, CoronedCard, FailureIcon, NavigationDrawer;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cesi_covid_19_tracker/shared/extensions/extensions.dart'
    show HoverExtensions, SizeBreakpoint;
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;

class CountryView extends StatefulWidget {
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  ScrollController _scrollController;
  TextEditingController _countryFilter;
  bool _resetFilter;

  @override
  void initState() {
    super.initState();
    _resetFilter = true;
    _countryFilter = TextEditingController(
        text: Modular.get<CoronedData>()
                .appTextTranslations
                ?.selectCountryDefaultText ??
            'Choisissez un pays');
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (!Modular.get<CoronedData>().isScrollToTopShown &&
          _scrollController.offset > aG.AppConstants.scrollToTopTreshold) {
        _showOverlay(context);
      }
      if (Modular.get<CoronedData>().isScrollToTopShown &&
          _scrollController.offset < aG.AppConstants.scrollToTopTreshold) {
        Modular.get<CoronedData>().removeScrollToTopButton();
      }
    });
  }

  @override
  void dispose() {
    _countryFilter?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoronedAppBar(
        isMobile: context.isMobile,
        isWatch: context.isWatch,
        textStyle: Theme.of(context).textTheme.headline1,
      ),
      drawer: NavigationDrawer(),
      body: Consumer<CoronedData>(builder: (_, cD) {
        if (cD.appTextTranslations == null)
          return Center(child: CircularProgressIndicator());
        if (_resetFilter) cD.resetFilter();
        _resetFilter = false;
        return cD.getCountryList != null
            ? cD.getCountryList.isNotEmpty
                ? Scrollbar(
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: cD.getFilteredCountries.length + 1,
                      itemBuilder: (_, i) => i == 0
                          ? Padding(
                              padding: _resolveInputTextPadding(),
                              child: TextField(
                                key: Key('select_country_text_field'),
                                decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  icon: Icon(Icons.search),
                                  isDense: true,
                                  alignLabelWithHint: true,
                                ),
                                onTap: () => _countryFilter.text.compareTo(cD
                                            .appTextTranslations
                                            .selectCountryDefaultText) ==
                                        0
                                    ? _countryFilter.text = ''
                                    : null,
                                onChanged: (value) {
                                  cD.filter(_countryFilter.text);
                                },
                                onEditingComplete: () {
                                  cD.filter(_countryFilter.text);
                                  FocusScope.of(context)
                                      .unfocus(); // Try to enforce TextInput unfocus
                                  if (_countryFilter.text == null ||
                                      _countryFilter.text.isEmpty)
                                    _countryFilter.text = cD.appTextTranslations
                                        .selectCountryDefaultText;
                                },
                                controller: _countryFilter,
                                maxLines: 1,
                                autocorrect: false,
                                dragStartBehavior: DragStartBehavior.down,
                                style: _resolveInputTextStyle(cD
                                    .appTextTranslations
                                    .selectCountryDefaultText),
                                cursorColor: (_countryFilter.text.compareTo(cD
                                                .appTextTranslations
                                                .selectCountryDefaultText) ==
                                            0 ||
                                        _countryFilter.text.isEmpty)
                                    ? Colors.grey[400]
                                    : Colors.blueGrey,
                                textAlignVertical: TextAlignVertical.bottom,
                                textInputAction: TextInputAction.search,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textDirection: Directionality.of(context),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: CoronedCard(
                                onTap: () {
                                  cD.setSelectedCountry(
                                      cD.getFilteredCountries.elementAt(i - 1));
                                  if (Modular.get<CoronedData>()
                                      .isScrollToTopShown)
                                    Modular.get<CoronedData>()
                                        .removeScrollToTopButton();
                                  Modular.link.pushNamed(cD.getFilteredCountries
                                      .elementAt(i - 1)
                                      .alpha2Code);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Image.network(
                                            '${cD.getFilteredCountries.elementAt(i - 1).flag}',
                                            height: 50.0,
                                            width: 50.0,
                                            scale: 1.0,
                                            repeat: ImageRepeat.noRepeat,
                                            fit: BoxFit.contain,
                                            errorBuilder: (_, e, stacktrace) =>
                                                Image.asset(
                                              'assets/img/missing_flag.png',
                                              height: 50.0,
                                              width: 50.0,
                                              fit: BoxFit.contain,
                                              semanticLabel: 'Unknown flag',
                                            ),
                                            frameBuilder: (context, child,
                                                frame, wasLoaded) {
                                              if (wasLoaded) {
                                                return child;
                                              }
                                              return frame == null
                                                  ? Image.asset(
                                                      'assets/img/missing_flag.png',
                                                      height: 50.0,
                                                      width: 50.0,
                                                      fit: BoxFit.contain,
                                                      semanticLabel:
                                                          'Unknown flag',
                                                    )
                                                  : child;
                                            },
                                            filterQuality: FilterQuality.low,
                                            semanticLabel:
                                                '${cD.getFilteredCountries.elementAt(i - 1).name} flag',
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              '${cD.getFilteredCountries.elementAt(i - 1).translations[cD.appLanguageCode.toLowerCase()] ?? cD.getFilteredCountries.elementAt(i - 1).name}',
                                              style: _resolveCountryTextStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ).showCursorOnHover,
                              ),
                            ),
                      cacheExtent: 150.0,
                    ),
                  )
                : Center(child: CircularProgressIndicator())
            : FailureIcon(
                fail: 'Oups ! Something went wrong.\nPlease, reload the app.');
      }),
    );
  }

  EdgeInsets _resolveInputTextPadding() => EdgeInsets.only(
        left: context.isMobile
            ? MediaQuery.of(context).size.width * 0.1
            : MediaQuery.of(context).size.width * 0.3,
        right: context.isMobile
            ? MediaQuery.of(context).size.width * 0.1
            : MediaQuery.of(context).size.width * 0.3,
        top: context.isMobile ? 8.0 : 18.0,
      );

  TextStyle _resolveInputTextStyle(String input) {
    return !context.isWatch
        ? _countryFilter.text.compareTo(input) == 0
            ? Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.grey[400])
            : Theme.of(context).textTheme.bodyText1
        : _countryFilter.text.compareTo(input) == 0
            ? Theme.of(context)
                .textTheme
                .bodyText1
                .apply(color: Colors.grey[400], fontSizeFactor: -4)
            : Theme.of(context).textTheme.bodyText1.apply(fontSizeFactor: -4);
  }

  TextStyle _resolveCountryTextStyle() => !context.isWatch
      ? Theme.of(context).textTheme.headline4
      : Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4);

  _showOverlay(BuildContext context) {
    final scrollToTopButton = aG.AppConstants.buildScrollToTopButton(
      () => _scrollController.animateTo(
        0.0,
        duration: Duration(
            milliseconds: _scrollController.offset / 3 >
                    aG.AppConstants.maxScrollToTopDuration
                ? aG.AppConstants.maxScrollToTopDuration
                : (_scrollController.offset / 3).floor()),
        curve: Curves.ease,
      ),
    );
    Modular.get<CoronedData>()
        .showScrollToTopButton(context, scrollToTopButton);
  }
}
