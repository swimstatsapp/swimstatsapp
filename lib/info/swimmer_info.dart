import 'package:flutter/material.dart';
// import 'package:swimstatsapp/times.dart';
import 'package:database/info/compare.dart';
import 'package:database/info/times.dart';
import 'package:database/info/meets.dart';
// import 'package:swimstatsapp/meets.dart';
// import 'package:swimstatsapp/lcm_scy_times.dart';

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
    print(information['swimmer'].free1000YTime);

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              child: Text('Click'),
              onPressed: () {
                print(information['swimmer'].free50YTime);
              }),
        ],
        title: Text(
            '${information['swimmer'].firstName} ${information['swimmer'].lastName}'),
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
          // DisplayTime(
          //   information['swimmer'].free50YTime,
          //   information['swimmer'].free50MTime,
          //   information['swimmer'].free100YTime,
          //   information['swimmer'].free100MTime,
          //   information['swimmer'].free200YTime,
          //   information['swimmer'].free200MTime,
          //   information['swimmer'].free500YTime,
          //   information['swimmer'].free400MTime,
          //   information['swimmer'].free1000YTime,
          //   information['swimmer'].free800MTime,
          //   information['swimmer'].free1650YTime,
          //   information['swimmer'].free1500MTime,
          //   information['swimmer'].back100YTime,
          //   information['swimmer'].back100MTime,
          //   information['swimmer'].back200YTime,
          //   information['swimmer'].back200MTime,
          //   information['swimmer'].brst100YTime,
          //   information['swimmer'].brst100MTime,
          //   information['swimmer'].brst200YTime,
          //   information['swimmer'].brst200MTime,
          //   information['swimmer'].fly100YTime,
          //   information['swimmer'].fly100MTime,
          //   information['swimmer'].fly200YTime,
          //   information['swimmer'].fly200MTime,
          //   information['swimmer'].im200YTime,
          //   information['swimmer'].im200MTime,
          //   information['swimmer'].im400YTime,
          //   information['swimmer'].im400MTime,
          // ),
          // Compare(information['swimmer'].name),
          // Meets(information['swimmer'].meets),
          Times(
              information['swimmer'].free50YTime,
              information['swimmer'].free50MTime,
              information['swimmer'].free100YTime,
              information['swimmer'].free100MTime,
              information['swimmer'].free200YTime,
              information['swimmer'].free200MTime,
              information['swimmer'].free500YTime,
              information['swimmer'].free400MTime,
              information['swimmer'].free1000YTime,
              information['swimmer'].free800MTime,
              information['swimmer'].free1650YTime,
              information['swimmer'].free1500MTime,
              information['swimmer'].back100YTime,
              information['swimmer'].back100MTime,
              information['swimmer'].back200YTime,
              information['swimmer'].back200MTime,
              information['swimmer'].brst100YTime,
              information['swimmer'].brst100MTime,
              information['swimmer'].brst200YTime,
              information['swimmer'].brst200MTime,
              information['swimmer'].fly100YTime,
              information['swimmer'].fly100MTime,
              information['swimmer'].fly200YTime,
              information['swimmer'].fly200MTime,
              information['swimmer'].im200YTime,
              information['swimmer'].im200MTime,
              information['swimmer'].im400YTime,
              information['swimmer'].im400MTime),
          Compare(
              name:
                  '${information['swimmer'].firstName} ${information['swimmer'].lastName}',
              free50YTime: information['swimmer'].free50YTime,
              free50MTime: information['swimmer'].free50MTime,
              free100YTime: information['swimmer'].free100YTime,
              free100MTime: information['swimmer'].free100MTime,
              free200YTime: information['swimmer'].free200YTime,
              free200MTime: information['swimmer'].free200MTime,
              free500YTime: information['swimmer'].free500YTime,
              free400MTime: information['swimmer'].free400MTime,
              free1000YTime: information['swimmer'].free1000YTime,
              free800MTime: information['swimmer'].free800MTime,
              free1650YTime: information['swimmer'].free1650YTime,
              free1500MTime: information['swimmer'].free1500MTime,
              back100YTime: information['swimmer'].back100YTime,
              back100MTime: information['swimmer'].back100MTime,
              back200YTime: information['swimmer'].back200YTime,
              back200MTime: information['swimmer'].back200MTime,
              brst100YTime: information['swimmer'].brst100YTime,
              brst100MTime: information['swimmer'].brst100MTime,
              brst200YTime: information['swimmer'].brst200YTime,
              brst200MTime: information['swimmer'].brst200MTime,
              fly100YTime: information['swimmer'].fly100YTime,
              fly100MTime: information['swimmer'].fly100MTime,
              fly200YTime: information['swimmer'].fly200YTime,
              fly200MTime: information['swimmer'].fly200MTime,
              im200YTime: information['swimmer'].im200YTime,
              im200MTime: information['swimmer'].im200MTime,
              im400YTime: information['swimmer'].im400YTime,
              im400MTime: information['swimmer'].im400MTime),
          Meets(fullUrl: information['swimmer'].fullUrl),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
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
              activeIcon: Icon(Icons.compare_arrows, color: Colors.blue),
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.black,
              ),
              label: 'Compare'),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue[50],
              activeIcon: Icon(Icons.history, color: Colors.blue),
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
    );
  }
}
