abstract class AppUtils {
  String formatLargeNumber(int number);
  Map<String, num> computeWeights(
    int cases,
    int deaths,
    int recovered,
    int active,
  );
  void openLink(String url);
}
