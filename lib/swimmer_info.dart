import 'package:flutter/material.dart';
import 'package:swimstatsapp/times.dart';
import 'package:swimstatsapp/standards.dart';
import 'package:swimstatsapp/compare.dart';
import 'package:swimstatsapp/meets.dart';

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
    Map information = ModalRoute.of(context)!.settings.arguments as Map;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('${information['swimmer'].name}'),
          centerTitle: true,
          leading: MaterialButton(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Times(),
            Standards(information['swimmer'].identifier,
                information['swimmer'].gender, information['swimmer'].intAge),
            Compare(),
            Meets(information['swimmer'].fullUrl),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue[50],
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue[50],
              activeIcon: Icon(Icons.timer_sharp, color: Colors.blue),
              icon: Icon(
                Icons.timer_sharp,
                color: Colors.black,
              ),
              label: 'Times',
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue[50],
                activeIcon: Icon(Icons.timer_sharp, color: Colors.blue),
                icon: Icon(
                  Icons.analytics_outlined,
                  color: Colors.black,
                ),
                label: 'Standards'),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue[50],
                activeIcon: Icon(Icons.timer_sharp, color: Colors.blue),
                icon: Icon(
                  Icons.compare_arrows,
                  color: Colors.black,
                ),
                label: 'Compare'),
            BottomNavigationBarItem(
                backgroundColor: Colors.blue[50],
                activeIcon: Icon(Icons.timer_sharp, color: Colors.blue),
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                label: 'Meets'),
          ],
          selectedItemColor: Colors.blue,
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
