import 'package:cesi_covid_19_tracker/ui/widgets/navbar_item/navbar_item.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/navigation_drawer/navigation_drawer_header.dart';
import 'package:flutter/material.dart';

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
          NavBarItem(
            'HOME',
            '/',
            icon: Icons.wb_iridescent,
          ),
          NavBarItem(
            'DASHBOARD',
            '/dashboard',
            icon: Icons.assignment,
          ),
        ],
      ),
    );
  }
}
