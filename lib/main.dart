import 'package:flutter/material.dart';
import 'package:swimstatsapp/privacypolicy.dart';
import 'package:swimstatsapp/create_url.dart';
import 'package:swimstatsapp/swimmer_info.dart';
import 'package:swimstatsapp/newhome.dart';
import 'package:swimstatsapp/how_to_use.dart';
import 'package:swimstatsapp/about.dart';
import 'package:swimstatsapp/times_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/displaytimes',
      routes: {
        '/newhome': (context) => NewHome(),
        '/privacypolicy': (context) => PrivacyPolicy(),
        '/createurl': (context) => CreateUrl(),
        '/swimmerinfo': (context) => SwimmerInfo(),
        '/howtouse': (context) => HowToUse(),
        '/about' : (context) => About(),
        '/displaytimes' : (context) => DisplayTime(),
      },
    );
  }
}
