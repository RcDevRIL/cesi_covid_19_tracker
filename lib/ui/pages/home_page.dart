import 'dart:convert';
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
      Card(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 4,
        ),
        elevation: 4.0,
        borderOnForeground: true,
        color: Colors.white60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: Colors.blue,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Header',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                'Culpa sit amet velit nostrud sint veniam aliqua eu Lorem culpa nulla excepteur ad quis. Incididunt ipsum consectetur cupidatat adipisicing pariatur eu officia cupidatat incididunt anim tempor consequat. Incididunt ad ad dolor ipsum irure enim quis laboris est eu exercitation sunt cupidatat.',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text('$_counter'),
            ],
          ),
        ),
      ),
    );
    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    return Scaffold(
      primary: true,
      drawer: NavigationDrawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            title: Text(widget.title),
            backgroundColor: Colors.blueGrey,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              children,
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
