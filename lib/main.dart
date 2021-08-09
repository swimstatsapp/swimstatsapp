import 'package:flutter/material.dart';

//importing documentation
import 'package:database/home.dart';
import 'package:database/docs/about.dart';
import 'package:database/docs/termsandconditions.dart';
import 'package:database/docs/privacypolicy.dart';

//importing menus
import 'package:database/menus/swimmer_menu.dart';
import 'package:database/info/swimmer_info.dart';
import 'package:database/menus/loading.dart';
import 'package:database/menus/goal_menu.dart';
import 'package:database/menus/updategoal_menu.dart';
import 'package:database/menus/identifier_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
          '/termsandconditions': (context) => TermsAndConditions(),
          '/privacypolicy': (context) => PrivacyPolicy(),
          '/swimmermenu': (context) => SwimmerMenu(),
          '/identifiermenu': (context) => IdentifierMenu(),
          '/swimmerinfo': (context) => SwimmerInfo(),
          '/loading': (context) => Loading(),
          '/goalmenu': (context) => GoalMenu(),
          '/updategoalmenu': (context) => UpdateGoalMenu(),
        });
  }
}
