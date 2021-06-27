import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select a Swimmer'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Text('Click the button to add a swimmer'),
              ),
            ),
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/swimmerinfo');
                  },
                  child: Text('Swimmer Info'),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addswimmer');
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
