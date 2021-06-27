import 'package:flutter/material.dart';
import 'package:swimstatsapp/home.dart';
import 'package:swimstatsapp/add_swimmer.dart';
import 'package:swimstatsapp/privacypolicy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/addswimmer': (context) => AddSwimmer(),
        '/privacypolicy': (context) => PrivacyPolicy(),
      },
    );
  }
}

