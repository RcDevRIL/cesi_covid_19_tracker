import 'package:flutter/material.dart';

/// Custom breakpoints when not using responsive_builder package
extension SizeBreakpoint on BuildContext {
  bool get isWatch => MediaQuery.of(this).size.width < 300;
  bool get isMobile => 300 <= MediaQuery.of(this).size.width && MediaQuery.of(this).size.width <= 600;
  bool get isTablet => 600 < MediaQuery.of(this).size.width && MediaQuery.of(this).size.width <= 900;
}
