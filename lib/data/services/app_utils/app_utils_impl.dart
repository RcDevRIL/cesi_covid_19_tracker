import 'app_utils.dart';

import 'package:intl/intl.dart' show NumberFormat;

class AppUtilsImpl implements AppUtils {
  @override
  String formatLargeNumber(int number) => number >= 1000
      ? NumberFormat("###,###,###", 'fr').format(number)
      : number.toString();
}
