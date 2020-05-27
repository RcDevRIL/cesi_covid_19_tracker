import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
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
    return Container(
      child: CoronedCard(
        children: [
          FailureIcon(
            fail: fail,
            backgroundColor: Colors.transparent,
            iconAndTextColor: iconAndTextColor,
          )
        ],
      ),
    );
  }
}
