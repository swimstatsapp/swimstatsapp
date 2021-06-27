import 'package:flutter/material.dart';
import 'package:swimstatsapp/times.dart';
import 'package:swimstatsapp/standards.dart';
import 'package:swimstatsapp/compare.dart';

class SwimmerInfo extends StatefulWidget {
  const SwimmerInfo({Key? key}) : super(key: key);

  @override
  _SwimmerInfoState createState() => _SwimmerInfoState();
}

class _SwimmerInfoState extends State<SwimmerInfo> {

  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text('Swimmer Stats'),
            ],
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [Times(), Standards(), Compare()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.timer_sharp,
              ),
              label: 'Times'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.analytics_outlined,
              ),
              label: 'Standards'
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.compare_arrows,
              ),
              label: 'Compare'
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}

