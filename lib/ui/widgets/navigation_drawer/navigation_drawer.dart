import 'package:flutter/material.dart';
import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart' show NavBarItem;
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;
import 'package:responsive_builder/responsive_builder.dart'
    show DeviceScreenType, ResponsiveBuilder;
import 'navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, sizingInformation) => sizingInformation.screenSize.height <
                  500 ||
              sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
              sizingInformation.deviceScreenType == DeviceScreenType.watch
          ? Container(
              width:
                  sizingInformation.deviceScreenType == DeviceScreenType.mobile
                      ? sizingInformation.screenSize.width * 0.95
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
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: aG.AppConstants.navItems.length,
                      itemBuilder: (_, i) => NavBarItem(
                        title: aG.AppConstants.navItems.elementAt(i).title,
                        navigationPath: aG.AppConstants.navItems
                            .elementAt(i)
                            .navigationPath,
                        icon: aG.AppConstants.navItems.elementAt(i).iconData,
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
