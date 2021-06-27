import 'package:flutter/material.dart';
import 'package:swimstatsapp/home.dart';
import 'package:swimstatsapp/add_swimmer.dart';
import 'package:swimstatsapp/privacypolicy.dart';
<<<<<<< HEAD
import 'package:swimstatsapp/swimmer_info.dart';
=======
import 'package:swimstatsapp/create_url.dart';
>>>>>>> f5fc76db3adc9bfadab32fe718be83b62010ac9a

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
<<<<<<< HEAD
        '/swimmerinfo': (context) => SwimmerInfo(),
=======
        '/createurl' : (context) => CreateUrl(),
>>>>>>> f5fc76db3adc9bfadab32fe718be83b62010ac9a
      },
    );
  }
}

