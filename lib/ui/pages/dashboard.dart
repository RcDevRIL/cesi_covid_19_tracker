import 'dart:async';
import 'dart:convert';

import 'package:cesi_covid_19_tracker/data/models/covid_latest.dart';
import 'package:cesi_covid_19_tracker/data/services/locator.dart';
import 'package:flutter/material.dart';

import 'package:cesi_covid_19_tracker/ui/widgets/widgets.dart';
import 'package:cesi_covid_19_tracker/data/constants/app_globals.dart' as aG;

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String _dropDownValue;
  String _apiResponse;
  StreamController _apiResponseController;

  @override
  void initState() {
    super.initState();
    _apiResponseController = StreamController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: aG.AppConstants.defaultAppTitle.split('\t\t')[0],
            style: Theme.of(context).textTheme.headline1,
            children: [
              TextSpan(
                text: '\t\t' + aG.AppConstants.defaultAppTitle.split('\t\t')[1],
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: NavigationDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: _buildChildren()
                ..add(
                  StreamBuilder(
                    stream: _apiResponseController.stream,
                    builder: (_, s) {
                      print('Has error: ${s.hasError}');
                      print('Has data: ${s.hasData}');
                      print('s Data ${s.data}');
                      if (s.hasError) {
                        return FailureIcon(fail: s.error);
                      }
                      if (s.hasData) {
                        return Text(
                          s.data,
                          style: TextStyle(color: Colors.black),
                        );
                      }
                      if (s.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!s.hasData &&
                          s.connectionState == ConnectionState.done) {
                        return FailureIcon(fail: 'No Data');
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildren() {
    List<Widget> children = [
      SizedBox(
        height: 24.0,
      ),
    ];
    children.add(
      Center(
        child: DropdownButton(
          key: Key('Country List'),
          onChanged: (value) {
            setState(() {
              _dropDownValue = value;
            });
            call(value);
          },
          hint: Text('Choisissez un pays'),
          elevation: 2,
          isExpanded: false,
          value: _dropDownValue,
          items: ['FR', 'US', 'UK', 'ERR']
              .map((e) => DropdownMenuItem(
                    child: Text('$e'),
                    value: e,
                  ))
              .toList(),
        ),
      ),
    );
    children.add(
      SizedBox(
        height: 24.0,
      ),
    );
    children.add(Text(
      _apiResponse ?? ' ',
      style: TextStyle(color: Colors.black),
    ));
    return children;
  }

  void call(String countryCode) async {
    locator
        .get<AppUtils>()
        .getDataFromCountry(countryCode)
        .then((value) => _apiResponseController.add(value))
        .catchError((e) => _apiResponseController.addError(e));
  }
}
