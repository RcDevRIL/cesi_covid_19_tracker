import 'package:flutter/material.dart';

import 'package:provider_architecture/provider_widget.dart';

import 'package:cesi_covid_19_tracker/data/models/navbar_item_model.dart';

class NavBarItemTabletDesktop extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title,
      style: TextStyle(fontSize: 18),
    );
  }
}
