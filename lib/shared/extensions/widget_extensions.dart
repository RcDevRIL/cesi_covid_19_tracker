import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Widget extension to show different mouse pointers
extension HoverExtensions on Widget {
  Widget get showCursorOnHover => MouseRegion(
        child: this,
        cursor: _resolveCursor(),
      );
  _resolveCursor() {
    switch (runtimeType) {
      case SelectableText:
        return SystemMouseCursors.text;
        break;
      default:
        return SystemMouseCursors.click;
        break;
    }
  }
}
