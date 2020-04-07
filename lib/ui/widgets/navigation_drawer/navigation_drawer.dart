import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart' show NavBarItem;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

import 'navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 16),
        ],
      ),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          ...aG.AppConstants.navItems.map((e) => NavBarItem(
                e.title,
                e.navigationPath,
                icon: e.iconData,
              )),
        ],
      ),
    );
  }
}
