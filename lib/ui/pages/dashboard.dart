import 'package:cesi_covid_19_tracker/ui/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'CORONED\t\tA covid-19 info app',
        ),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
