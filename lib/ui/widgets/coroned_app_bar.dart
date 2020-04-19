import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class CoronedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const CoronedAppBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Image.asset('assets/cesilogo.png'),
      ],
      title: Text(
        aG.AppConstants.defaultAppTitle.split('\n')[0],
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
