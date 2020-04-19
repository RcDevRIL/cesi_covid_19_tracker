import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedAppBar, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class CovidFaq extends StatefulWidget {
  @override
  _CovidFaqState createState() => _CovidFaqState();
}

class _CovidFaqState extends State<CovidFaq> {
  final items = aG.FAQDataSource.questionReponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: CoronedAppBar(appBar: AppBar()),
      drawer: NavigationDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    var children = <Widget>[
      SizedBox(
        height: 24.0,
      ),
    ];
    for (Map<String, String> item in items) {
      children.addAll(
        <Widget>[
          ListTile(
            title: Text(
              item.values.elementAt(0),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .apply(color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item.values.elementAt(1),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .apply(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            width: 12.0,
          )
        ],
      );
    }
    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    return children;
  }
}
