import 'package:flutter/material.dart';

import 'package:provider_architecture/provider_widget.dart';

import 'package:cesi_covid_19_tracker/data/models/navbar_item_model.dart';

class NavBarItemMobile extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(model.iconData),
          SizedBox(
            width: 30,
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
