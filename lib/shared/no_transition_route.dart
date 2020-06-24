import 'package:flutter/material.dart';

class NoTransitionRouteBuilder extends PageRouteBuilder {
  final Widget page;
  NoTransitionRouteBuilder({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
        );
}
