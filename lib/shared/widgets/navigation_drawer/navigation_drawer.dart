import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/shared/widgets/widgets.dart'
    show NavBarItem;
import 'package:cesi_covid_19_tracker/shared/constants/app_globals.dart' as aG;
import 'package:responsive_builder/responsive_builder.dart'
    show ResponsiveBuilder;
import 'navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

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
              child: Column(
                children: <Widget>[
                  NavigationDrawerHeader(
                    height: sizingInformation.screenSize.height * 0.3,
                  ),
                  Container(
                    height: sizingInformation.screenSize.height * 0.7,
                    child: Scrollbar(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: aG.AppConstants.navItems.length,
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
                                title:
                                    aG.AppConstants.navItems.elementAt(i).title,
                                navigationPath: aG.AppConstants.navItems
                                    .elementAt(i)
                                    .navigationPath,
                                icon: aG.AppConstants.navItems
                                    .elementAt(i)
                                    .iconData,
                              )
                            : NavBarItem(
                                title:
                                    aG.AppConstants.navItems.elementAt(i).title,
                                navigationPath: aG.AppConstants.navItems
                                    .elementAt(i)
                                    .navigationPath,
                                icon: aG.AppConstants.navItems
                                    .elementAt(i)
                                    .iconData,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 16),
                ],
              ),
              child: Column(
                children: <Widget>[
                  NavigationDrawerHeader(),
                  ...aG.AppConstants.navItems.map(
                    (e) => NavBarItem(
                      title: e.title,
                      navigationPath: e.navigationPath,
                      icon: e.iconData,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
