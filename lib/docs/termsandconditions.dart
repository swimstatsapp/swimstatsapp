import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: Text('Terms and Conditions'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Terms and Conditions here'),
            ),
          ],
        ),
      ),
    );
  }
}
