class CovidNotFoundException implements Exception {
  final String message;
  CovidNotFoundException(this.message);
  @override
  String toString() {
    return this.message;
  }
}
