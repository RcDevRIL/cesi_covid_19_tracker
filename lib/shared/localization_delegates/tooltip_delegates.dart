import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// TEMPORARY
/// workaround to override tooltips on auto generated menu button and back button
/// found on (https://medium.com/@caleb_52205/flutter-removing-appbar-tooltips-app-wide-from-materialapp-constructor-54781606266f)
class AppBarTooltipsTextOverride extends DefaultMaterialLocalizations {
  AppBarTooltipsTextOverride(Locale locale) : super();
  @override
  String get backButtonTooltip => null;
  @override
  String get openAppDrawerTooltip => null;
}

class AppBarTooltipsTextDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const AppBarTooltipsTextDelegate();
  @override
  Future<AppBarTooltipsTextOverride> load(Locale locale) {
    return SynchronousFuture(AppBarTooltipsTextOverride(locale));
  }

  @override
  bool shouldReload(AppBarTooltipsTextDelegate old) => false;
  @override
  bool isSupported(Locale locale) => true;
}
