import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:cesi_covid_19_tracker/shared/shared.dart'
    show SizeBreakpoint, CoronedAppBar, NavigationDrawer;
import 'package:cesi_covid_19_tracker/modules/main_module/main_blocs.dart'
    show CoronedData;

class CovidFaq extends StatefulWidget {
  @override
  _CovidFaqState createState() => _CovidFaqState();
}

class _CovidFaqState extends State<CovidFaq> {
  List<Map<String, String>> items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoronedAppBar(
        isMobile: context.isMobile,
        isWatch: context.isWatch,
        textStyle: Theme.of(context).textTheme.headline1,
      ),
      drawer: NavigationDrawer(),
      body: Consumer<CoronedData>(builder: (context, cD) {
        if (cD.appTextTranslations == null)
          return Center(child: CircularProgressIndicator());
        items = _buildItems(cD);
        return Scrollbar(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            padding: const EdgeInsets.symmetric(vertical: 24),
            itemBuilder: (c, i) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                mouseCursor: SystemMouseCursors.basic,
                title: Text(
                  items.elementAt(i).values.elementAt(0),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .apply(color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    items.elementAt(i).values.elementAt(1),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .apply(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  List<Map<String, String>> _buildItems(CoronedData cD) {
    return [
      {
        'question': cD.appTextTranslations.faqQuestion1,
        'answer': cD.appTextTranslations.faqAnswer1
      },
      {
        'question': cD.appTextTranslations.faqQuestion2,
        'answer': cD.appTextTranslations.faqAnswer2
      },
      {
        'question': cD.appTextTranslations.faqQuestion3,
        'answer': cD.appTextTranslations.faqAnswer3
      },
      {
        'question': cD.appTextTranslations.faqQuestion4,
        'answer': cD.appTextTranslations.faqAnswer4
      },
      {
        'question': cD.appTextTranslations.faqQuestion5,
        'answer': cD.appTextTranslations.faqAnswer5
      },
      {
        'question': cD.appTextTranslations.faqQuestion6,
        'answer': cD.appTextTranslations.faqAnswer6
      },
      {
        'question': cD.appTextTranslations.faqQuestion7,
        'answer': cD.appTextTranslations.faqAnswer7
      },
      {
        'question': cD.appTextTranslations.faqQuestion9,
        'answer': cD.appTextTranslations.faqAnswer8
      },
      {
        'question': cD.appTextTranslations.faqQuestion10,
        'answer': cD.appTextTranslations.faqAnswer9
      }
    ];
  }
}
