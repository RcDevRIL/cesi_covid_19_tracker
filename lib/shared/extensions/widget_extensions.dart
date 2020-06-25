import 'package:flutter/material.dart' show MouseRegion, SelectableText, Widget;
import 'package:flutter/rendering.dart';

// ignore_for_file: avoid_web_libraries_in_flutter

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
