import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CoronedCard extends StatefulWidget {
  final List<Widget> children;
  final void Function() onTap;
  const CoronedCard({Key key, this.children = const [], this.onTap})
      : super(key: key);
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.children,
                  ),
                ),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children,
                ),
              ),
            ),
    );
  }
}
