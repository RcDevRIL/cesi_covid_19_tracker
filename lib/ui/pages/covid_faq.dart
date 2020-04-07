import 'dart:html';

import 'package:cesi_covid_19_tracker/data/constants/datasource.dart';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class CovidFaq extends StatefulWidget {
  @override
  _CovidFaqState createState() => _CovidFaqState();
 
}

class _CovidFaqState extends State<CovidFaq> {
   final items = DataSource.questionReponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: aG.AppConstants.defaultAppTitle.split('\t\t')[0],
            style: Theme.of(context).textTheme.headline1,
            children: [
              TextSpan(
                text: '\t\t' + aG.AppConstants.defaultAppTitle.split('\t\t')[1],
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
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
    );
  }


 
  

  List<Widget> _buildChildren() {
    var children = <Widget>[
      SizedBox(
        height: 24.0,
      ),
    ];
    for(var i = 0; i < items.length; i++)
    {
      children.add(
        Text(items[i])
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
