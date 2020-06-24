import 'dart:async' show StreamController;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextCapitalization, TextInputAction;
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:cesi_covid_19_tracker/ui/pages/pages.dart' show DetailsPage;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, CoronedData, locator;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedAppBar, CoronedCard, FailureIcon, NavigationDrawer;
import 'package:provider/provider.dart' show Provider;
import 'package:cesi_covid_19_tracker/shared/extensions/extensions.dart'
    show HoverExtensions;

class CountryView extends StatefulWidget {
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  StreamController<String> _covidApiResponseController;
  TextEditingController _countryFilter;
  bool resetFilter;

  @override
  void initState() {
    super.initState();
    resetFilter = true;
    _covidApiResponseController = StreamController();
    _countryFilter = TextEditingController(text: 'Choisissez un pays');
  }

  @override
  void dispose() {
    _covidApiResponseController?.close();
    _countryFilter?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final coronedData = Provider.of<CoronedData>(context);
    if (resetFilter) coronedData.resetFilter();
    resetFilter = false;
    return Scaffold(
      appBar: CoronedAppBar(appBar: AppBar()),
      drawer: NavigationDrawer(),
      body: coronedData.getCountryList != null
          ? coronedData.getCountryList.isNotEmpty
              ? Scrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: coronedData.getFilteredCountries.length + 1,
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
                              onTap: () => _countryFilter.text
                                          .compareTo('Choisissez un pays') ==
                                      0
                                  ? _countryFilter.text = ''
                                  : null,
                              onChanged: (value) {
                                coronedData.filter(_countryFilter.text);
                              },
                              onEditingComplete: () {
                                coronedData.filter(_countryFilter.text);
                                FocusScope.of(context)
                                    .unfocus(); // Try to enforce TextInput unfocus
                                if (_countryFilter.text == null ||
                                    _countryFilter.text.isEmpty)
                                  _countryFilter.text = 'Choisissez un pays';
                              },
                              controller: _countryFilter,
                              maxLines: 1,
                              autocorrect: false,
                              dragStartBehavior: DragStartBehavior.down,
                              style: _resolveInputTextStyle(),
                              cursorColor: (_countryFilter.text.compareTo(
                                              'Choisissez un pays') ==
                                          0 ||
                                      _countryFilter.text.isEmpty)
                                  ? Colors.grey[400]
                                  : Colors.blueGrey,
                              textAlignVertical: TextAlignVertical.bottom,
                              textInputAction: TextInputAction.search,
                              textCapitalization: TextCapitalization.sentences,
                              textDirection: Directionality.of(context),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CoronedCard(
                              onTap: () {
                                coronedData.setSelectedCountry(coronedData
                                    .getFilteredCountries
                                    .elementAt(i - 1));
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => DetailsPage(
                                        countryName: coronedData
                                            .getFilteredCountries
                                            .elementAt(i - 1)
                                            .translations['fr'],
                                        countryCode: coronedData
                                            .getFilteredCountries
                                            .elementAt(i - 1)
                                            .alpha2Code)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Image.network(
                                          '${coronedData.getFilteredCountries.elementAt(i - 1).flag}',
                                          height: 50.0,
                                          width: 50.0,
                                          scale: 1.0,
                                          repeat: ImageRepeat.noRepeat,
                                          fit: BoxFit.contain,
                                          errorBuilder: (_, e, stacktrace) =>
                                              Image.asset(
                                            'assets/missing_flag.png',
                                            height: 50.0,
                                            width: 50.0,
                                            fit: BoxFit.contain,
                                            semanticLabel: 'Unknown flag',
                                          ),
                                          frameBuilder: (context, child, frame,
                                              wasLoaded) {
                                            if (wasLoaded) {
                                              return child;
                                            }
                                            return frame == null
                                                ? Image.asset(
                                                    'assets/missing_flag.png',
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
                                              '${coronedData.getFilteredCountries.elementAt(i - 1).name} flag',
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Text(
                                            '${coronedData.getFilteredCountries.elementAt(i - 1).translations['fr']}',
                                            style: _resolveCountryTextStyle(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ).showCursorOnHover,
                          ),
                    cacheExtent: 150.0,
                  ),
                )
              : Center(child: CircularProgressIndicator())
          : FailureIcon(
              fail: 'Oups ! Something went wrong.\nPlease, reload the app.'),
    );
  }

  EdgeInsets _resolveInputTextPadding() => EdgeInsets.only(
        left: MediaQuery.of(context).size.width <= 600
            ? MediaQuery.of(context).size.width * 0.1
            : MediaQuery.of(context).size.width * 0.3,
        right: MediaQuery.of(context).size.width <= 600
            ? MediaQuery.of(context).size.width * 0.1
            : MediaQuery.of(context).size.width * 0.3,
        top: MediaQuery.of(context).size.width <= 600 ? 8.0 : 18.0,
      );

  TextStyle _resolveInputTextStyle() {
    return MediaQuery.of(context).size.width >= 300
        ? _countryFilter.text.compareTo('Choisissez un pays') == 0
            ? Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.grey[400])
            : Theme.of(context).textTheme.bodyText1
        : _countryFilter.text.compareTo('Choisissez un pays') == 0
            ? Theme.of(context)
                .textTheme
                .bodyText1
                .apply(color: Colors.grey[400], fontSizeFactor: -4)
            : Theme.of(context).textTheme.bodyText1.apply(fontSizeFactor: -4);
  }

  TextStyle _resolveCountryTextStyle() =>
      MediaQuery.of(context).size.width >= 300
          ? Theme.of(context).textTheme.headline4
          : Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4);

  void getCountryData(String countryCode) {
    locator
        .get<ApiService>()
        .getDataFromCountry(countryCode)
        .then((value) => _covidApiResponseController.add(value))
        .catchError((e) => _covidApiResponseController.addError(e));
  }
}
