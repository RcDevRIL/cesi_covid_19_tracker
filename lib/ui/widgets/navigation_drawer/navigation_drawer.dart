import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/navbar_item/navbar_item.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

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
        ]..addAll(aG.AppConstants.navItems.map((e) => NavBarItem(
              e.title,
              e.navigationPath,
              icon: e.iconData,
            ))),
      ),
    );
  }
}
