import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:swimstatsapp/newhome.dart';

// class DisplayTime extends StatefulWidget {
//   const DisplayTime({Key? key}) : super(key: key);
//
//   @override
//   _DisplayTimeState createState() => _DisplayTimeState();
// }
//
// class _DisplayTimeState extends State<DisplayTime> {
//
//
//   List<dynamic> times = [
//     'LCM',
//     'Event',
//     'SCY',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//     '',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView(
//         scrollDirection: Axis.vertical,
//         controller: ScrollController(),
//         physics: ScrollPhysics(),
//         padding: EdgeInsets.all(10.0),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           mainAxisSpacing: 10.0,
//           crossAxisSpacing: 0.0,
//           childAspectRatio: 3.0,
//         ),
//         children: times
//             .map((e) => Container(
//                   height: 100.0,
//                   width: 100.0,
//                   color: Colors.blue[200],
//                   alignment: Alignment.center,
//                   child: Text('$e'),
//                 ))
//             .toList(),
//       ),
//     );
//   }
// }


class DisplayTime extends StatelessWidget {

  String free50YTime = '';
  String free50MTime = '';
  String free100YTime = '';
  String free100MTime = '';
  String free200YTime = '';
  String free200MTime = '';
  String free500YTime = '';
  String free400MTime = '';
  String free1000YTime = '';
  String free800MTime = '';
  String free1650YTime = '';
  String free1500MTime = '';
  String back100YTime = '';
  String back100MTime = '';
  String back200YTime = '';
  String back200MTime = '';
  String brst100YTime = '';
  String brst100MTime = '';
  String brst200YTime = '';
  String brst200MTime = '';
  String fly100YTime = '';
  String fly100MTime = '';
  String fly200YTime = '';
  String fly200MTime = '';
  String im200YTime = '';
  String im200MTime = '';
  String im400YTime = '';
  String im400MTime = '';

  DisplayTime(
      String free50YTime,
      String free50MTime,
      String free100YTime,
      String free100MTime,
      String free200YTime,
      String free200MTime,
      String free500YTime,
      String free400MTime,
      String free1000YTime,
      String free800MTime,
      String free1650YTime,
      String free1500MTime,
      String back100YTime,
      String back100MTime,
      String back200YTime,
      String back200MTime,
      String brst100YTime,
      String brst100MTime,
      String brst200YTime,
      String brst200MTime,
      String fly100YTime,
      String fly100MTime,
      String fly200YTime,
      String fly200MTime,
      String im200YTime,
      String im200MTime,
      String im400YTime,
      String im400MTime,) {
    this.free50YTime = free50YTime;
    this.free50MTime = free50MTime;
    this.free100YTime = free100YTime;
    this.free100MTime = free100MTime;
    this.free200YTime = free200YTime;
    this.free200MTime = free200MTime;
    this.free500YTime = free500YTime;
    this.free400MTime = free400MTime;
    this.free1000YTime = free1000YTime;
    this.free800MTime = free800MTime;
    this.free1650YTime = free1650YTime;
    this.free1500MTime = free1500MTime;
    this.back100YTime = back100YTime;
    this.back100MTime = back100MTime;
    this.back200YTime = back200YTime;
    this.back200MTime = back200MTime;
    this.brst100YTime = brst100YTime;
    this.brst100MTime = brst100MTime;
    this.brst200YTime = brst200YTime;
    this.brst200MTime = brst200MTime;
    this.fly100YTime = fly100YTime;
    this.fly100MTime = fly100MTime;
    this.fly200YTime = fly200YTime;
    this.fly200MTime = fly200MTime;
    this.im200YTime = im200YTime;
    this.im200MTime = im200MTime;
    this.im400YTime = im400YTime;
    this.im400MTime = im400MTime;
  }

  List<dynamic> times = [
    'LCM',
    'Event',
    'SCY',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 3.0,
        ),
        children: times
            .map((e) => Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: Text('$e'),
                ))
            .toList(),
      ),
    );
  }
}
