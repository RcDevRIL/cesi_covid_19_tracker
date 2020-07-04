import 'package:cesi_covid_19_tracker/data/services/provider/coroned_data.dart';
import 'package:cesi_covid_19_tracker/shared/text_translations_delegate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;
import 'package:flutter_modular/flutter_modular.dart';

class NavigationDrawerHeader extends StatelessWidget {
  final height;

  const NavigationDrawerHeader({Key key, this.height = 150}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CoronedData coronedData = Modular.get<CoronedData>();
    return Container(
      height: height,
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: DropdownButton(
              dropdownColor: Theme.of(context).primaryColor,
              elevation: 1,
              iconEnabledColor: Colors.white70,
              underline: Container(),
              key: Key('Language Selection'),
              onChanged: (String countryCode) async {
                coronedData.setAppLanguageCode(countryCode);
                TextTranslations.load(aG.AppConstants.coronedSupportedLocales
                        .firstWhere(
                            (element) => element.countryCode == countryCode))
                    .then((newTT) => coronedData.setAppTextTranslations(newTT));
              },
              itemHeight: 48.0,
              value: coronedData.appLanguageCode ?? 'FR',
              items: _buildFlagsDropdown(),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'CORONED\n',
                style: Theme.of(context).textTheme.headline1,
                children: [
                  TextSpan(
                    text: 'A covid-19 info App',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildFlagsDropdown() =>
      aG.AppConstants.coronedSupportedLocales.map(
        (locale) {
          var test = Image.asset(
            'assets/l10n/flags/${locale.languageCode}.png',
            height: 48.0,
            width: 48.0,
            fit: BoxFit.contain,
          );
          return DropdownMenuItem(
            value: locale.countryCode,
            child: Row(
              children: [
                test,
              ],
            ),
          );
        },
      ).toList();
}
