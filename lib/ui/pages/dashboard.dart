import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
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
    );
  }
}
