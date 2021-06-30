import 'package:flutter/material.dart';
import 'package:swimstatsapp/privacypolicy.dart';
import 'package:swimstatsapp/create_url.dart';
import 'package:swimstatsapp/swimmer_info.dart';
import 'package:swimstatsapp/newhome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/newhome',
      routes: {
        '/newhome': (context) => NewHome(),
        '/privacypolicy': (context) => PrivacyPolicy(),
        '/createurl': (context) => CreateUrl(),
        '/swimmerinfo': (context) => SwimmerInfo(),
      },
    );
  }
}
