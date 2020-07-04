import 'package:cesi_covid_19_tracker/data/models/models.dart';
import 'package:cesi_covid_19_tracker/data/services/provider/coroned_data.dart';
import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/shared/widgets/widgets.dart'
    show NavBarItem;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_builder/responsive_builder.dart'
    show ResponsiveBuilder;
import 'navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) => sizingInformation.screenSize.height <
                  500 ||
              sizingInformation.screenSize.width < 600
          ? Container(
              width: sizingInformation.screenSize.width < 350
                  ? sizingInformation.screenSize.width * 0.8
                  : 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 16),
                ],
              ),
              child: Consumer<CoronedData>(builder: (_, cD) {
                final List<NavBarItemModel> navItems = _buildNavList(cD);
                return Column(
                  children: <Widget>[
                    NavigationDrawerHeader(
                      height: sizingInformation.screenSize.height * 0.3,
                    ),
                    Container(
                      height: sizingInformation.screenSize.height * 0.7,
                      child: Scrollbar(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: navItems.length,
                          itemBuilder: (_, i) => sizingInformation
                                      .screenSize.width <
                                  350
                              ? NavBarItem(
                                  horizontalSpacing:
                                      sizingInformation.screenSize.width < 250
                                          ? 10.0
                                          : 25.0,
                                  verticalSpacing:
                                      sizingInformation.screenSize.height < 340
                                          ? sizingInformation.screenSize.width <
                                                  250
                                              ? 20
                                              : 35.0
                                          : sizingInformation.screenSize.width <
                                                  250
                                              ? 20
                                              : 40.0,
                                  title: navItems.elementAt(i).title,
                                  navigationPath:
                                      navItems.elementAt(i).navigationPath,
                                  icon: navItems.elementAt(i).iconData,
                                )
                              : NavBarItem(
                                  title: navItems.elementAt(i).title,
                                  navigationPath:
                                      navItems.elementAt(i).navigationPath,
                                  icon: navItems.elementAt(i).iconData,
                                ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            )
          : Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 16),
                ],
              ),
              child: Consumer<CoronedData>(
                builder: (_, cD) {
                  final List<NavBarItemModel> navItems = _buildNavList(cD);
                  return Column(
                    children: <Widget>[
                      NavigationDrawerHeader(),
                      ...navItems.map(
                        (e) => NavBarItem(
                          title: e.title,
                          navigationPath: e.navigationPath,
                          icon: e.iconData,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }

  List<NavBarItemModel> _buildNavList(CoronedData cD) {
    return [
      NavBarItemModel(
        title: 'DASHBOARD',
        iconData: Icons.blur_circular,
        navigationPath: '/dashboard',
      ),
      NavBarItemModel(
        title: 'COUNTRIES',
        iconData: Icons.location_searching,
        navigationPath: '/country',
      ),
      NavBarItemModel(
        title: 'FAQ',
        iconData: Icons.question_answer,
        navigationPath: '/faq',
      ),
      NavBarItemModel(
        title: cD.appTextTranslations.about.toUpperCase(),
        iconData: Icons.info_outline,
        navigationPath: '/about',
      )
    ];
  }
}
