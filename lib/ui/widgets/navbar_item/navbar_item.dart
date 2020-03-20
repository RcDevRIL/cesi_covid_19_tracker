import 'package:cesi_covid_19_tracker/ui/widgets/navbar_item/navbar_item_mobile.dart';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/data/models/navbar_item_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      iconData: icon,
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(navigationPath);
      },
      child: Provider.value(
        value: model,
        child: ScreenTypeLayout(
          desktop: NavBarItemMobile(),
          tablet: NavBarItemMobile(),
          mobile: NavBarItemMobile(),
        ),
      ),
    );
  }
}
