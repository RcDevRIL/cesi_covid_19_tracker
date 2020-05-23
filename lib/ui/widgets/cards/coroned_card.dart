import 'package:flutter/material.dart';

import 'package:responsive_builder/responsive_builder.dart';

class CoronedCard extends StatefulWidget {
  final List<Widget> children;
  const CoronedCard({Key key, this.children = const []}) : super(key: key);
  @override
  _CoronedCardState createState() => _CoronedCardState();
}

class _CoronedCardState extends State<CoronedCard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfos) {
      return Card(
        margin: EdgeInsets.symmetric(
          horizontal: sizingInfos.isDesktop || sizingInfos.isTablet
              ? MediaQuery.of(context).size.width / 4
              : 12.0,
        ),
        elevation: 4.0,
        borderOnForeground: true,
        color: Colors.white60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: Colors.blueGrey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children,
          ),
        ),
      );
    });
  }
}
