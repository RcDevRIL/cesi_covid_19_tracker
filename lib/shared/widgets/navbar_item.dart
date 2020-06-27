import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:cesi_covid_19_tracker/data/models/models.dart'
    show NavBarItemModel;
import 'package:cesi_covid_19_tracker/shared/extensions/extensions.dart'
    show HoverExtensions;

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
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(navigationPath),
      child: Provider.value(
        value: model,
        child: Padding(
          padding:
              EdgeInsets.only(left: horizontalSpacing, top: verticalSpacing),
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
