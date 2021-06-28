import 'package:flutter/material.dart';
import 'package:swimstatsapp/cardtemplate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<SwimmerData> swimmerList = [SwimmerData(name:'Andrew Luo',age:'17'), SwimmerData(name:'Marshall Yuan',age:'17')];
  Widget cardTemplate(swimmer) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget> [
          Text(swimmer.name,
          style:TextStyle(
            fontSize: 20,
            ),
          ),
          Text("Age: ${swimmer.age}"),
        ],
      ),
    );
  }

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
              child:  Text('Click the button to add a swimmer')
            ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/swimmerinfo');
                  },
                  child: Text('Swimmer Info'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: swimmerList.map((swimmer) => cardTemplate(swimmer)).toList(),
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
