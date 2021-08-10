import 'package:flutter/material.dart';
import 'package:database/model/goal.dart';
import 'package:database/database/goal_database.dart';

import 'package:flutter/rendering.dart';

import 'package:fluttertoast/fluttertoast.dart';

List<Goal> goals = [];
String initialSort = 'All';

class Compare extends StatefulWidget {
  final String name;
  final String free50YTime;
  final String free50MTime;
  final String free100YTime;
  final String free100MTime;
  final String free200YTime;
  final String free200MTime;
  final String free500YTime;
  final String free400MTime;
  final String free1000YTime;
  final String free800MTime;
  final String free1650YTime;
  final String free1500MTime;
  final String back100YTime;
  final String back100MTime;
  final String back200YTime;
  final String back200MTime;
  final String brst100YTime;
  final String brst100MTime;
  final String brst200YTime;
  final String brst200MTime;
  final String fly100YTime;
  final String fly100MTime;
  final String fly200YTime;
  final String fly200MTime;
  final String im200YTime;
  final String im200MTime;
  final String im400YTime;
  final String im400MTime;
  Compare({
    required this.name,
    required this.free50YTime,
    required this.free50MTime,
    required this.free100YTime,
    required this.free100MTime,
    required this.free200YTime,
    required this.free200MTime,
    required this.free500YTime,
    required this.free400MTime,
    required this.free1000YTime,
    required this.free800MTime,
    required this.free1650YTime,
    required this.free1500MTime,
    required this.back100YTime,
    required this.back100MTime,
    required this.back200YTime,
    required this.back200MTime,
    required this.brst100YTime,
    required this.brst100MTime,
    required this.brst200YTime,
    required this.brst200MTime,
    required this.fly100YTime,
    required this.fly100MTime,
    required this.fly200YTime,
    required this.fly200MTime,
    required this.im200YTime,
    required this.im200MTime,
    required this.im400YTime,
    required this.im400MTime,
  });

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  double timeSecondsConversion(String originalTime) {
    double totalSeconds = 0;
    double minutes = 0;
    double seconds = 0;
    double minuteSeconds = 0;
    if (originalTime.contains(':')) {
      try {
        minutes = double.parse(originalTime.substring(0, 2) + ".00");
        seconds = double.parse(originalTime.substring(3, originalTime.length));
        minuteSeconds = minutes * 60.0;
      } catch (e) {
        minutes = double.parse(originalTime.substring(0, 1) + ".00");
        seconds = double.parse(originalTime.substring(2, originalTime.length));
        minuteSeconds = minutes * 60.0;
      }

      // rounding to hundredths
      totalSeconds = (minuteSeconds + seconds) * 100;
      totalSeconds = totalSeconds.ceilToDouble();
      totalSeconds = totalSeconds / 100;
    } else {
      double seconds = double.parse(originalTime);
      totalSeconds = seconds;
    }
    return totalSeconds;
  }

  //calculate Need
  double calculateNeed(goalTime, customTime) {
    double goalTimeSeconds = timeSecondsConversion(goalTime);
    double currentTimeSeconds = timeSecondsConversion(customTime);
    double need = 0;

    need = currentTimeSeconds - goalTimeSeconds;
    need = (need * 100).ceilToDouble();
    need = need / 100;
    return need;
  }

  //calculate Need%
  double calculatePercentNeed(goalTime, customTime) {
    double goalTimeSeconds = timeSecondsConversion(goalTime);
    double currentTimeSeconds = timeSecondsConversion(customTime);
    double need = 0;

    need = 1 - (goalTimeSeconds / currentTimeSeconds);
    need = (need * 100).ceilToDouble();
    need = need / 100;

    return need;
  }

  bool isLoading = false;

  //refresh swimmer list
  Future refreshGoals() async {
    setState(() => isLoading = true);

    goals = await GoalDatabase.instance.readAll();
    for (int x = 0; x < goals.length; x++) {
      if (goals[x].name == widget.name) {
        goals[x].isVisible = true;
      } else {
        goals[x].isVisible = false;
      }

      // if (goals[x].currentComparison == 'Current Time') {
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '50') {
      //     goals[x].currentTime = widget.free50YTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '50') {
      //     goals[x].currentTime = widget.free50MTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.free100YTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.free100MTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.free200YTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.free200MTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '500') {
      //     goals[x].currentTime = widget.free500YTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '400') {
      //     goals[x].currentTime = widget.free400MTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '1000') {
      //     goals[x].currentTime = widget.free1000YTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '800') {
      //     goals[x].currentTime = widget.free800MTime;
      //   }

      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '1650') {
      //     goals[x].currentTime = widget.free1650YTime;
      //   }
      //   if (goals[x].stroke == 'Freestyle' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '1500') {
      //     goals[x].currentTime = widget.free1500MTime;
      //   }
      //   if (goals[x].stroke == 'Backstroke' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.back100YTime;
      //   }
      //   if (goals[x].stroke == 'Backstroke' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.back100MTime;
      //   }
      //   if (goals[x].stroke == 'Backstroke' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.back200YTime;
      //   }
      //   if (goals[x].stroke == 'Backstroke' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.back200MTime;
      //   }
      //   if (goals[x].stroke == 'Breaststroke' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.brst100YTime;
      //   }
      //   if (goals[x].stroke == 'Breaststroke' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.brst100MTime;
      //   }
      //   if (goals[x].stroke == 'Breaststroke' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.brst200YTime;
      //   }
      //   if (goals[x].stroke == 'Breaststroke' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.brst200MTime;
      //   }
      //   if (goals[x].stroke == 'Butterfly' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.fly100YTime;
      //   }
      //   if (goals[x].stroke == 'Butterfly' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '100') {
      //     goals[x].currentTime = widget.fly100MTime;
      //   }
      //   if (goals[x].stroke == 'Butterfly' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.fly200YTime;
      //   }
      //   if (goals[x].stroke == 'Butterfly' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.fly200MTime;
      //   }
      //   if (goals[x].stroke == 'IM' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.im200YTime;
      //   }
      //   if (goals[x].stroke == 'IM' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '200') {
      //     goals[x].currentTime = widget.im200MTime;
      //   }
      //   if (goals[x].stroke == 'IM' &&
      //       goals[x].unit == 'SCY' &&
      //       goals[x].distance == '400') {
      //     goals[x].currentTime = widget.im400YTime;
      //   }
      //   if (goals[x].stroke == 'IM' &&
      //       goals[x].unit == 'LCM' &&
      //       goals[x].distance == '400') {
      //     goals[x].currentTime = widget.im400MTime;
      //   }
      // }
      // final goal = Goal(
      //   id: goals[x].id,
      //   name: goals[x].name,
      //   unit: goals[x].unit,
      //   distance: goals[x].distance,
      //   stroke: goals[x].stroke,
      //   goalTime: goals[x].goalTime,
      //   currentTime: goals[x].currentTime,
      //   needValue: calculateNeed(goals[x].goalTime, goals[x].currentTime),
      //   needPercentValue:
      //       calculatePercentNeed(goals[x].goalTime, goals[x].currentTime),
      //   currentComparison: goals[x].currentComparison,
      // );
      // await GoalDatabase.instance.update(goal);
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    print('initialized compare');

    initialSort = 'All';

    refreshGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton(
                      value: initialSort,
                      items: [
                        DropdownMenuItem(child: Text('All'), value: 'All'),
                        DropdownMenuItem(
                            child: Text('Freestyle'), value: 'Freestyle'),
                        DropdownMenuItem(
                            child: Text('Breaststroke'), value: 'Breaststroke'),
                        DropdownMenuItem(
                            child: Text('Backstroke'), value: 'Backstroke'),
                        DropdownMenuItem(
                            child: Text('Butterfly'), value: 'Butterfly'),
                        DropdownMenuItem(child: Text('IM'), value: 'IM')
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          initialSort = newValue!;

                          for (int x = 0; x < goals.length; x++) {
                            if (initialSort == 'All' &&
                                goals[x].name == widget.name) {
                              goals[x].isVisible = true;
                            } else if (goals[x].stroke == initialSort &&
                                goals[x].name == widget.name) {
                              goals[x].isVisible = true;
                            } else {
                              goals[x].isVisible = false;
                            }
                          }
                        });
                      })
                ],
              ),
              if (goals.isEmpty)
                Center(child: Text('Click the button to add a goal.'))
            ] +
            goals
                .map((element) => Visibility(
                      visible: element.isVisible!,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                  element.distance! +
                                      " " +
                                      element.unit! +
                                      " " +
                                      element.stroke!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blue[800])),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('CURRENT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Container(
                                        color: Colors.blue[50],
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        child: Text(element.currentTime!,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ))),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('GOAL',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Container(
                                        color: Colors.blue[50],
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        child: Text(element.goalTime!,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ))),
                                  ],
                                ),
                                if (element.needValue! > 0.0)
                                  Column(
                                    children: [
                                      Text('NEED',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Container(
                                          color: Colors.red[50],
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Text('-${element.needValue}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                              ))),
                                    ],
                                  )
                                else
                                  Column(
                                    children: [
                                      Text('NEED',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Container(
                                          color: Colors.green[50],
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Text('✓',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                              ))),
                                    ],
                                  ),
                                if (element.needValue! > 0.0)
                                  Column(
                                    children: [
                                      Text('% NEED',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Container(
                                          color: Colors.red[50],
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Text(
                                              '-${element.needPercentValue}%',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                              ))),
                                    ],
                                  )
                                else
                                  Column(
                                    children: [
                                      Text('% NEED',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Container(
                                          color: Colors.green[50],
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          child: Text('✓',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                              ))),
                                    ],
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  child: Row(
                                    children: [
                                      Text('EDIT'),
                                      Icon(Icons.edit, size: 15),
                                    ],
                                  ),
                                  onPressed: () {
                                    print(element.id);
                                    Navigator.of(context).pushNamed(
                                        '/updategoalmenu',
                                        arguments: {
                                          'id': element.id,
                                          'name': widget.name,
                                          'unit': element.unit,
                                          'distance': element.distance,
                                          'stroke': element.stroke,
                                          'goalTime': element.goalTime,
                                          'currentTime': element.currentTime,
                                          'free50YTime': widget.free50YTime,
                                          'free50MTime': widget.free50MTime,
                                          'free100YTime': widget.free100YTime,
                                          'free100MTime': widget.free100MTime,
                                          'free200YTime': widget.free200YTime,
                                          'free200MTime': widget.free200MTime,
                                          'free500YTime': widget.free500YTime,
                                          'free400MTime': widget.free400MTime,
                                          'free1000YTime': widget.free1000YTime,
                                          'free800MTime': widget.free800MTime,
                                          'free1650YTime': widget.free1650YTime,
                                          'free1500MTime': widget.free1500MTime,
                                          'back100YTime': widget.back100YTime,
                                          'back100MTime': widget.back100MTime,
                                          'back200YTime': widget.back200YTime,
                                          'back200MTime': widget.back200MTime,
                                          'brst100YTime': widget.brst100YTime,
                                          'brst100MTime': widget.brst100MTime,
                                          'brst200YTime': widget.brst200YTime,
                                          'brst200MTime': widget.brst200MTime,
                                          'fly100YTime': widget.fly100YTime,
                                          'fly100MTime': widget.fly100MTime,
                                          'fly200YTime': widget.fly200YTime,
                                          'fly200MTime': widget.fly200MTime,
                                          'im200YTime': widget.im200YTime,
                                          'im200MTime': widget.im200MTime,
                                          'im400YTime': widget.im400YTime,
                                          'im400MTime': widget.im400MTime,
                                        }).then((value) {
                                      refreshGoals();
                                    });
                                  },
                                ),
                                MaterialButton(
                                    child: Text('DELETE'),
                                    onPressed: () async {
                                      await GoalDatabase.instance
                                          .delete(element.id!);
                                      refreshGoals();
                                      setState(() {
                                        Fluttertoast.showToast(
                                          msg: "Removed goal.",
                                          backgroundColor:
                                              Colors.black.withOpacity(0.3),
                                          textColor: Colors.white,
                                        );
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Navigator.of(context).pushNamed('/goalmenu', arguments: {
            'name': widget.name,
            'free50YTime': widget.free50YTime,
            'free50MTime': widget.free50MTime,
            'free100YTime': widget.free100YTime,
            'free100MTime': widget.free100MTime,
            'free200YTime': widget.free200YTime,
            'free200MTime': widget.free200MTime,
            'free500YTime': widget.free500YTime,
            'free400MTime': widget.free400MTime,
            'free1000YTime': widget.free1000YTime,
            'free800MTime': widget.free800MTime,
            'free1650YTime': widget.free1650YTime,
            'free1500MTime': widget.free1500MTime,
            'back100YTime': widget.back100YTime,
            'back100MTime': widget.back100MTime,
            'back200YTime': widget.back200YTime,
            'back200MTime': widget.back200MTime,
            'brst100YTime': widget.brst100YTime,
            'brst100MTime': widget.brst100MTime,
            'brst200YTime': widget.brst200YTime,
            'brst200MTime': widget.brst200MTime,
            'fly100YTime': widget.fly100YTime,
            'fly100MTime': widget.fly100MTime,
            'fly200YTime': widget.fly200YTime,
            'fly200MTime': widget.fly200MTime,
            'im200YTime': widget.im200YTime,
            'im200MTime': widget.im200MTime,
            'im400YTime': widget.im400YTime,
            'im400MTime': widget.im400MTime,
          }).then((value) {
            refreshGoals();
          });
        },
      ),
    );
  }
}
