import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _url = 'https://swimstatsapp.github.io/';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not launch $_url';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: MaterialButton(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('About'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('./assets/logo.png'),
                height: 100,
                width: 100),
            Column(children: [
              Center(
                child: Text('SwimStats 2021',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Center(
                child: Text('Licensed under the Apache License 2.0'),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text('Version 1.0.2'),
              ),
              Center(
                child: TextButton(
                    child: Text('Visit our website'),
                    onPressed: () {
                      _launchURL();
                    }),
              ),
            ]),
          ],
        )),
      ),
    );
  }
}
