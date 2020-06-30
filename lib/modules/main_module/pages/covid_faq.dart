import 'package:cesi_covid_19_tracker/shared/text_translations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/shared/widgets/widgets.dart'
    show CoronedAppBar, NavigationDrawer;
import 'package:cesi_covid_19_tracker/shared/extensions/extensions.dart'
    show SizeBreakpoint;
import 'package:flutter/rendering.dart';

class CovidFaq extends StatefulWidget {
  @override
  _CovidFaqState createState() => _CovidFaqState();
}

class _CovidFaqState extends State<CovidFaq> {
  List<Map<String, String>> items;

  @override
  void initState() {
    super.initState();
    items = [
      {
        'question': TextTranslations.currentTranslation.faqQuestion1,
        'answer': TextTranslations.currentTranslation.faqAnswer1
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion2,
        'answer': TextTranslations.currentTranslation.faqAnswer2
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion3,
        'answer': TextTranslations.currentTranslation.faqAnswer3
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion4,
        'answer': TextTranslations.currentTranslation.faqAnswer4
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion5,
        'answer': TextTranslations.currentTranslation.faqAnswer5
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion6,
        'answer': TextTranslations.currentTranslation.faqAnswer6
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion7,
        'answer': TextTranslations.currentTranslation.faqAnswer7
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion9,
        'answer': TextTranslations.currentTranslation.faqAnswer8
      },
      {
        'question': TextTranslations.currentTranslation.faqQuestion10,
        'answer': TextTranslations.currentTranslation.faqAnswer9
      }
    ];
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
      body: Scrollbar(
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
      ),
    );
  }
}
