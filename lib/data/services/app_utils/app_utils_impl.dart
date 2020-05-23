import 'app_utils.dart';
import 'dart:collection';
import 'package:intl/intl.dart' show NumberFormat;

class AppUtilsImpl implements AppUtils {
  @override
  String formatLargeNumber(int number) => number >= 1000
      ? NumberFormat("###,###,###", 'fr').format(number)
      : number.toString();

  @override
  Map<String, num> computeWeights(int c, int d, int r) {
    HashMap<String, num> result = HashMap<String, num>();
    result.putIfAbsent('total', () => c + r + d);
    result.putIfAbsent('weightContaminated', () => c / result['total']);
    result.putIfAbsent('weightDeath', () => d / result['total']);
    result.putIfAbsent('weightRecovered', () => d / result['total']);
    return result;
  }
}
