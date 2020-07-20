import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show AppConstants, HoverExtensions;
import 'package:cesi_covid_19_tracker/data/services/services.dart'
    show AppUtils, locator;

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
              onTap: () =>
                  locator.get<AppUtils>().openLink(AppConstants.cesiDijonUrl),
              child: Image.asset(
                'assets/img/cesilogo.png',
                fit: BoxFit.contain,
                height: isMobile ? 150 : isWatch ? 100 : null,
                width: isMobile ? 150 : isWatch ? 100 : null,
              ),
            ).showCursorOnHover,
          ],
          title: Text(
            AppConstants.defaultAppTitle.split('\n').first,
            style: isWatch ? textStyle.apply(fontSizeDelta: -4) : textStyle,
            overflow: TextOverflow.visible,
          ),
        );
}
