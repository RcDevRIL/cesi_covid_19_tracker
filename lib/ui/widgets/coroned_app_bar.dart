import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:responsive_builder/responsive_builder.dart';

class CoronedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  const CoronedAppBar({Key key, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizes) => sizes.isMobile || sizes.isWatch
          ? AppBar(
              actions: [
                Image.asset(
                  'assets/cesilogo.png',
                  fit: BoxFit.contain,
                  height: 150,
                  width: 150,
                ),
              ],
              title: Text(
                aG.AppConstants.defaultAppTitle.split('\n')[0],
                style: sizes.isWatch
                    ? Theme.of(context)
                        .textTheme
                        .headline1
                        .apply(fontSizeDelta: -4)
                    : Theme.of(context).textTheme.headline1,
                overflow: TextOverflow.visible,
              ),
            )
          : AppBar(
              actions: [
                Image.asset(
                  'assets/cesilogo.png',
                  fit: BoxFit.contain,
                ),
              ],
              title: Text(
                aG.AppConstants.defaultAppTitle.split('\n')[0],
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
