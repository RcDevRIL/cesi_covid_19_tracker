import 'package:flutter/material.dart';

class FailureIcon extends StatelessWidget {
  final String fail;
  const FailureIcon({
    Key key,
    this.fail = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fail.isNotEmpty
        ? Container(
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 50.0,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  fail,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : Container(
            height: 50.0,
            width: 50.0,
            color: Colors.black87,
            child: Center(
              child: Icon(
                Icons.cancel,
                color: Colors.red,
                size: 50.0,
              ),
            ),
          );
  }
}
