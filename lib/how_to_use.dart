import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          title: Text('How to Use'),
          centerTitle: true,
        ),
        body: Center(child: Text('Insert Quick Tutorial Here')),
      ),
    );
  }
}
