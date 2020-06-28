import 'package:flutter/cupertino.dart';

/// Custom breakpoints when not using responsive_builder package
extension SizeBreakpoint on BuildContext {
  bool get isWatch => MediaQuery.of(this).size.width <= 300;
  bool get isMobile => MediaQuery.of(this).size.width <= 600;
  bool get isTablet => MediaQuery.of(this).size.width <= 900;
}
