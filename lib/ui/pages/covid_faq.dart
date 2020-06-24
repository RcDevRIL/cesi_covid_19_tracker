import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart'
    show CoronedAppBar, NavigationDrawer;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class CovidFaq extends StatefulWidget {
  @override
  _CovidFaqState createState() => _CovidFaqState();
}

class _CovidFaqState extends State<CovidFaq> {
  final items = aG.FAQDataSource.questionReponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoronedAppBar(appBar: AppBar()),
      drawer: NavigationDrawer(),
      body: Scrollbar(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 24.0,
            ),
            ...items.map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      e.values.elementAt(0),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .apply(color: Colors.black),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        e.values.elementAt(1),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .apply(color: Colors.black),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
