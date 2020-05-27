import 'package:flutter/material.dart';

class FailureIcon extends StatelessWidget {
  final String fail;
  final Color backgroundColor;
  final Color iconAndTextColor;
  final double iconSize;

  const FailureIcon({
    Key key,
    this.fail = '',
    this.backgroundColor = Colors.black87,
    this.iconAndTextColor = Colors.red,
    this.iconSize = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fail.isNotEmpty
        ? Container(
            color: backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: iconAndTextColor,
                  size: iconSize,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  fail,
                  style: TextStyle(
                    color: iconAndTextColor,
                  ),
                ),
              ],
            ),
          )
        : Container(
            height: iconSize,
            width: iconSize,
            color: backgroundColor,
            child: Center(
              child: Icon(
                Icons.cancel,
                color: iconAndTextColor,
                size: iconSize,
              ),
            ),
          );
  }
}
