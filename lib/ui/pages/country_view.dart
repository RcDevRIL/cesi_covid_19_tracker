import 'dart:async';
import 'package:cesi_covid_19_tracker/ui/pages/pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/data/services/services.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedCard, FailureIcon, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CountryView extends StatefulWidget {
  @override
  _CountryViewState createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  StreamController<String> _covidApiResponseController;
  TextEditingController _countryFilter;

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      primary: true,
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
              ? ListView(
                  physics: const BouncingScrollPhysics(),
                  primary: true,
                  shrinkWrap: true,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: _buildChildren(coronedData),
                )
              : Center(child: CircularProgressIndicator())
          : FailureIcon(fail: 'How is this even possible?'),
    );
  }

  List<Widget> _buildChildren(CoronedData coronedData) => <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: 24.0,
            left: MediaQuery.of(context).size.width <= 600
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width <= 600
                ? MediaQuery.of(context).size.width * 0.1
                : MediaQuery.of(context).size.width * 0.3,
          ),
          child: TextField(
            decoration: InputDecoration(fillColor: Colors.black),
            onTap: () =>
                _countryFilter.text.compareTo('Choisissez un pays') == 0
                    ? _countryFilter.text = ''
                    : null,
            onChanged: (value) {
              _countryFilter.text;
              coronedData.filter(_countryFilter.text);
            },
            onEditingComplete: () => coronedData.filter(_countryFilter.text),
            controller: _countryFilter,
            maxLines: 1,
            autocorrect: false,
            dragStartBehavior: DragStartBehavior.down,
            style: _countryFilter.text.compareTo('Choisissez un pays') == 0
                ? Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.grey[400])
                : Theme.of(context).textTheme.bodyText1,
            cursorColor:
                _countryFilter.text.compareTo('Choisissez un pays') == 0
                    ? Colors.grey[400]
                    : Colors.blueGrey,
            textAlignVertical: TextAlignVertical.bottom,
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.sentences,
            textDirection: Directionality.of(context),
          ),
        ),
        ...coronedData.getFilteredCountries.map(
          (e) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CoronedCard(
              onTap: () {
                coronedData.setSelectedCountry(e);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DetailsPage(country: e)));
              },
              children: [
                Row(
                  children: <Widget>[
                    Hero(
                      tag: '${e.name}_flag',
                      child: Image.network(
                        '${e.flag}',
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        '${e.name}',
                        style: Theme.of(context).textTheme.headline4,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ];

  void getCountryData(String countryCode) {
    locator
        .get<ApiService>()
        .getDataFromCountry(countryCode)
        .then((value) => _covidApiResponseController.add(value))
        .catchError((e) => _covidApiResponseController.addError(e));
  }
}

/*       
StreamBuilder<String>(
  stream: _covidApiResponseController.stream, 
  builder: (_, AsyncSnapshot<String> s) {
    print('Has error: ${s.hasError}');
    print('Has data: ${s.hasData}');
    if (s.hasError) {
      return FailureIcon(fail: s.error);
    }
    if (s.hasData) {
      print('Snapshot Data ${s.data}');
      return CountryCard(
        covidCountryInfos: CovidCountryInfos.fromJson(jsonDecode(s.data)),
        );
    }
    if (!s.hasData && s.connectionState == ConnectionState.done) {
      return FailureIcon(fail: 'No Data');
    } else {
      return Container();
    }
  },
),
*/
