import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show CoronedCard, FailureIcon;

import 'coroned_card.dart';

class FailureCard extends StatelessWidget {
  final String fail;
  final Color iconAndTextColor;
  const FailureCard({
    Key key,
    @required this.fail,
    this.iconAndTextColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CoronedCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FailureIcon(
          fail: fail,
          backgroundColor: Colors.transparent,
          iconAndTextColor: iconAndTextColor,
        ),
      ),
    );
  }
}
