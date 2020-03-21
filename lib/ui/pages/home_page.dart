import 'dart:convert';
import 'package:cesi_covid_19_tracker/data/models/covid_latest.dart';
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
  String _apiResponse;
  double _amount = 250;

  @override
  Widget build(BuildContext context) {
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
              children: _buildChildren(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          CovidLatest test = CovidLatest.fromJson(jsonDecode(
              await locator.get<AppUtils>().getWorldLatestSituation()));
          setState(() {
            _apiResponse = test.apiResponse['confirmed'].toString();
          });
        },
        tooltip: 'call API',
        child: Icon(Icons.call),
      ),
    );
  }

  List<Widget> _buildChildren() {
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
          items: ['FR', 'US', 'UK']
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
            width: _amount,
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                '${_apiResponse ?? ' '}', // display ' ' if _apiResponse == null
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    return children;
  }
}
