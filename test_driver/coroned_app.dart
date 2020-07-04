import 'package:flutter_driver/driver_extension.dart'
    show enableFlutterDriverExtension;
import 'package:cesi_covid_19_tracker/main.dart' as app;

void main() {
  enableFlutterDriverExtension(); // Enable the extension
  app.main(); // Call [main] function of the app
}
