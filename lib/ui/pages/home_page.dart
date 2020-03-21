import 'dart:convert';
import 'package:cesi_covid_19_tracker/ui/widgets/coroned_card.dart';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/services/locator.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({
    Key key,
    this.title = aG.AppConstants.defaultAppTitle,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _dropDownValue;
  String _counter;
  double _amount = 250;

  @override
  void initState() {
    super.initState();
    _dropDownValue = 'FR';
  }

  @override
  Widget build(BuildContext context) {
    List<String> countries = ['FR', 'US', 'UK'];
    List<Widget> children = [
      SizedBox(
        height: 24.0,
      ),
    ];
    children.add(
      Center(
        child: DropdownButton(
          key: Key('Country List'),
          onChanged: (value) {
            setState(() {
              _dropDownValue = value;
            });
          },
          hint: Text('Choisissez un pays'),
          elevation: 2,
          isExpanded: false,
          value: _dropDownValue,
          items: countries
              .map((e) => DropdownMenuItem(
                    child: Text('$e'),
                    value: e,
                  ))
              .toList(),
        ),
      ),
    );
    children.add(
      CoronedCard(
        children: <Widget>[
          Text(
            'Statistiques Mondiales',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'CAS CONFIRMES',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Container(
            height: 10.0,
            width: _amount,
            color: Colors.amber,
          ),
          Text('$_counter'),
        ],
      ),
    );
    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: NavigationDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Map<String, Object> test = jsonDecode(await locator
              .get<AppUtils>()
              .getDataFromCountry('FR')); //build Map with given JSON String
          setState(() {
            _counter = jsonEncode(
                test.entries.first.value); //Build String with given JSON Map
          });
        },
        tooltip: 'call API',
        child: Icon(Icons.call),
      ),
    );
  }
}
