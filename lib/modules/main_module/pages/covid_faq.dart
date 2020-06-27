import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/shared/widgets/widgets.dart'
    show CoronedAppBar, NavigationDrawer;
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;

class CovidFaq extends StatefulWidget {
  @override
  _CovidFaqState createState() => _CovidFaqState();
}

class _CovidFaqState extends State<CovidFaq> {
  final items = aG.FAQDataSource.questionReponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoronedAppBar(
        isMobile: MediaQuery.of(context).size.width < 600.0,
        isWatch: MediaQuery.of(context).size.width < 350.0,
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
