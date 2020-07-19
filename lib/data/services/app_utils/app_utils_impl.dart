import 'dart:collection' show HashMap;
import 'package:intl/intl.dart' show NumberFormat;
import 'package:url_launcher/url_launcher.dart' show canLaunch, launch;

import 'app_utils.dart';

class AppUtilsImpl implements AppUtils {
  @override
  String formatLargeNumber(int number) => number >= 1000
      ? NumberFormat("###,###,###", 'fr').format(number)
      : number.toString();

  @override
  Map<String, num> computeWeights(
    int cases,
    int deaths,
    int recovered,
    int active,
  ) {
    if (cases < 0 || deaths < 0 || recovered < 0) throw 'Invalid value';
    HashMap<String, num> result = HashMap<String, num>();
    result.putIfAbsent('total', () => cases);
    result.putIfAbsent('weightContaminated', () => active / result['total']);
    result.putIfAbsent('weightDeath', () => deaths / result['total']);
    result.putIfAbsent('weightRecovered', () => recovered / result['total']);
    return result;
  }

  @override
  void openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
