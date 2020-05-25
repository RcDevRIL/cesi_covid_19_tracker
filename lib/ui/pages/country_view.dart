import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:cesi_covid_19_tracker/ui/pages/pages.dart' show DetailsPage;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show ApiService, CoronedData, locator;
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedCard, FailureIcon, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        actions: [
          Image.asset('assets/cesilogo.png'),
        ],
        title: Text(
          aG.AppConstants.defaultAppTitle.split('\n')[0],
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      drawer: NavigationDrawer(),
      body: coronedData.getCountryList != null
          ? coronedData.getCountryList.isNotEmpty
              ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  primary: true,
                  itemCount: coronedData.getFilteredCountries.length + 1,
                  itemBuilder: (_, i) => i == 0
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width <= 600
                                ? MediaQuery.of(context).size.width * 0.1
                                : MediaQuery.of(context).size.width * 0.3,
                          ),
                          child: TextField(
                            decoration:
                                InputDecoration(fillColor: Colors.black),
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
                            style: _countryFilter.text
                                        .compareTo('Choisissez un pays') ==
                                    0
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.grey[400])
                                : Theme.of(context).textTheme.bodyText1,
                            cursorColor: (_countryFilter.text
                                            .compareTo('Choisissez un pays') ==
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
                                      country: coronedData.getFilteredCountries
                                          .elementAt(i - 1))));
                            },
                            children: [
                              Row(
                                children: <Widget>[
                                  Image.network(
                                    '${coronedData.getFilteredCountries.elementAt(i - 1).flag}',
                                    height: 50.0,
                                    width: 50.0,
                                    fit: BoxFit.contain,
                                    frameBuilder:
                                        (context, child, frame, wasLoaded) {
                                      if (wasLoaded) {
                                        return child;
                                      }
                                      return frame == null
                                          ? Image.asset(
                                              'assets/missing_flag.png',
                                              height: 50.0,
                                              width: 50.0,
                                              fit: BoxFit.contain,
                                              semanticLabel: 'Unknown flag',
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
                                  Expanded(
                                    child: Text(
                                      '${coronedData.getFilteredCountries.elementAt(i - 1).name}',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                  cacheExtent: 150.0,
                )
              : Center(child: CircularProgressIndicator())
          : FailureIcon(
              fail: 'Oups ! Something went wrong.\nPlease, reload the app.'),
    );
  }

  void getCountryData(String countryCode) {
    locator
        .get<ApiService>()
        .getDataFromCountry(countryCode)
        .then((value) => _covidApiResponseController.add(value))
        .catchError((e) => _covidApiResponseController.addError(e));
  }
}
