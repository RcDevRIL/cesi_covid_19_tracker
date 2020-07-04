import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart' show Modular;
import 'package:provider/provider.dart' show Provider;

import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show NavBarItemModel;
import 'package:cesi_covid_19_tracker/shared/shared.dart' show HoverExtensions;
import 'package:cesi_covid_19_tracker/modules/blocs.dart' show CoronedData;

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  final double verticalSpacing;
  final double horizontalSpacing;

  const NavBarItem({
    this.title,
    this.navigationPath,
    this.icon,
    this.verticalSpacing = 50.0,
    this.horizontalSpacing = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    final model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    final coronedData = Modular.get<CoronedData>();
    return GestureDetector(
      onTap: () {
        if (coronedData.isScrollToTopShown)
          coronedData.removeScrollToTopButton();
        Modular.to.pushNamed(
          navigationPath,
        );
      },
      child: Provider.value(
        value: model,
        child: Padding(
          padding: EdgeInsets.only(
              left: horizontalSpacing,
              top: verticalSpacing / 2,
              bottom: verticalSpacing / 2),
          child: Row(
            children: <Widget>[
              Icon(model.iconData),
              SizedBox(
                width: horizontalSpacing,
              ),
              Text(
                model.title,
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ).showCursorOnHover,
        ),
      ),
    );
  }
}
