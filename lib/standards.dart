import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class Standards extends StatefulWidget {
  final String identifier;
  final String gender;
  final int age;

  Standards(this.identifier, this.gender, this.age);

  @override
  _StandardsState createState() => _StandardsState();
}

class _StandardsState extends State<Standards> {


  void initState() {
    super.initState();
    print('Calling initState for Standards');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Standards'),
      ),
    );
  }
}
