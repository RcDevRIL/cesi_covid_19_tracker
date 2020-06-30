import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils, locator;
import 'package:cesi_covid_19_tracker/shared/extensions/extensions.dart'
    show HoverExtensions;

typedef void OpenDrawerCallback();

class CoronedAppBar extends AppBar {
  final bool isMobile;
  final bool isWatch;
  final TextStyle textStyle;

  CoronedAppBar({
    Key key,
    @required this.isMobile,
    @required this.isWatch,
    @required this.textStyle,
  }) : super(
          key: key,
          titleSpacing: 0.0,
          actions: [
            GestureDetector(
              onTap: () => locator
                  .get<AppUtils>()
                  .openLink(aG.AppConstants.cesiDijonUrl),
              child: Image.asset(
                'assets/img/cesilogo.png',
                fit: BoxFit.contain,
                height: isMobile ? isWatch ? 100 : 150 : null,
                width: isMobile ? isWatch ? 100 : 150 : null,
              ),
            ).showCursorOnHover,
          ],
          title: Text(
            aG.AppConstants.defaultAppTitle.split('\n')[0],
            style: isWatch ? textStyle.apply(fontSizeDelta: -4) : textStyle,
            overflow: TextOverflow.visible,
          ),
        );
}
