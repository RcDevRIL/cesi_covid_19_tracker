import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart'
    show ResponsiveBuilder;

typedef OnTapCallback = void Function();

class CoronedCard extends StatefulWidget {
  final Widget child;
  final OnTapCallback onTap;
  const CoronedCard({Key key, this.child, this.onTap}) : super(key: key);
  @override
  _CoronedCardState createState() => _CoronedCardState();
}

class _CoronedCardState extends State<CoronedCard> {
  double _resolveMargin(bool isLarge) =>
      isLarge ? MediaQuery.of(context).size.width / 4 : 12.0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInfos) => widget.onTap != null
          ? GestureDetector(
              onTap: widget.onTap,
              child: Card(
                margin: EdgeInsets.symmetric(
                  horizontal: _resolveMargin(
                      sizingInfos.isDesktop || sizingInfos.isTablet),
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
                child: widget.child,
              ),
            )
          : Card(
              margin: EdgeInsets.symmetric(
                horizontal: _resolveMargin(
                    sizingInfos.isDesktop || sizingInfos.isTablet),
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
              child: widget.child,
            ),
    );
  }
}
