import 'package:flutter/material.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: 'CORONED\n',
          style: Theme.of(context).textTheme.headline1,
          children: [
            TextSpan(
              text: 'A covid-19 info App',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
