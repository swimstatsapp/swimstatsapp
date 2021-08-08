import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:database/model/goal.dart';
import 'package:database/database/goal_database.dart';

class UpdateGoalMenu extends StatefulWidget {
  const UpdateGoalMenu({Key? key}) : super(key: key);

  @override
  _UpdateGoalMenuState createState() => _UpdateGoalMenuState();
}

class _UpdateGoalMenuState extends State<UpdateGoalMenu> {
  //created global key, needed for form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showInput = true;

  String? _currentComparison = 'Custom';
  String? comparisonText = 'Current Time';
  String? name;
  String? currentUnit;
  String? currentYardage;
  String? currentStroke;
  String? goalTime;
  String? customTime;
  double? needValue = 0;
  double? needPercentValue = 0;
  String? initialSort = 'All';
  String? free50YTime;
  String? free50MTime;
  String? free100YTime;
  String? free100MTime;
  String? free200YTime;
  String? free200MTime;
  String? free500YTime;
  String? free400MTime;
  String? free1000YTime;
  String? free800MTime;
  String? free1650YTime;
  String? free1500MTime;
  String? back100YTime;
  String? back100MTime;
  String? back200YTime;
  String? back200MTime;
  String? brst100YTime;
  String? brst100MTime;
  String? brst200YTime;
  String? brst200MTime;
  String? fly100YTime;
  String? fly100MTime;
  String? fly200YTime;
  String? fly200MTime;
  String? im200YTime;
  String? im200MTime;
  String? im400YTime;
  String? im400MTime;

  List<String> yardage = ['25', '50', '100', '200', '500', '1000', '1650'];
  List<String> stroke = [
    'Freestyle',
    'Breaststroke',
    'Backstroke',
    'Butterfly'
  ];
  List<String> SCYyardage = ['25', '50', '100', '200', '500', '1000', '1650'];

  List<String> LCMyardage = ['50', '100', '200', '400', '800', '1500'];
  List<String> SCMyardage = ['50', '100', '200', '400', '800', '1500'];

  List<String> twentyfiveevents = [
    'Freestyle',
    'Breaststroke',
    'Backstroke',
    'Butterfly'
  ];
  List<String> fiftyevents = [
    'Freestyle',
    'Breaststroke',
    'Backstroke',
    'Butterfly'
  ];
  List<String> hundredevents = [
    'Freestyle',
    'Breaststroke',
    'Backstroke',
    'Butterfly',
    'IM'
  ];
  List<String> twohundredevents = [
    'Freestyle',
    'Breaststroke',
    'Backstroke',
    'Butterfly',
    'IM'
  ];
  List<String> fourhundredeventslongcourse = ['Freestyle', 'IM'];
  List<String> fourhundredeventsshortcourse = ['IM'];
  List<String> fivehundredevents = ['Freestyle'];
  List<String> eighthundredthousandevents = ['Freestyle'];
  List<String> mileevents = ['Freestyle'];

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

  bool hasStarted = false;
  @override
  Widget build(BuildContext context) {
    Map information = ModalRoute.of(context)!.settings.arguments as Map;

    int? id;
    if (hasStarted == false) {
      name = information['name'];
      currentUnit = information['unit'];
      currentYardage = information['distance'];
      currentStroke = information['stroke'];
      goalTime = information['goalTime'];
      customTime = information['currentTime'];
      id = information['id'];
      name = information['name'];
      free50YTime = information['free50YTime'];
      free50MTime = information['free50MTime'];
      free100YTime = information['free100YTime'];
      free100MTime = information['free100MTime'];
      free200YTime = information['free200YTime'];
      free200MTime = information['free200MTime'];
      free500YTime = information['free500YTime'];
      free400MTime = information['free400MTime'];
      free1000YTime = information['free1000YTime'];
      free800MTime = information['free800MTime'];
      free1650YTime = information['free1650YTime'];
      free1500MTime = information['free1500MTime'];
      back100YTime = information['back100YTime'];
      back100MTime = information['back100MTime'];
      back200YTime = information['back200YTime'];
      back200MTime = information['back200MTime'];
      brst100YTime = information['brst100YTime'];
      brst100MTime = information['brst100MTime'];
      brst200YTime = information['brst200YTime'];
      brst200MTime = information['brst200MTime'];
      fly100YTime = information['fly100YTime'];
      fly100MTime = information['fly100MTime'];
      fly200YTime = information['fly200YTime'];
      fly200MTime = information['fly200MTime'];
      im200YTime = information['im200YTime'];
      im200MTime = information['im200MTime'];
      im400YTime = information['im400YTime'];
      im400MTime = information['im400MTime'];
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Edit Goal'),
          actions: [
            TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() == true) {
                    _formKey.currentState!.save();
                    if (_currentComparison == 'Current Time') {
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '50') {
                        customTime = free50YTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '500') {
                        customTime = free50MTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '100') {
                        customTime = free100YTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '100') {
                        customTime = free100MTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '200') {
                        customTime = free200YTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '200') {
                        customTime = free200MTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '500') {
                        customTime = free500YTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '400') {
                        customTime = free400MTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '1000') {
                        customTime = free1000YTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '800') {
                        customTime = free800MTime!;
                      }

                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '1650') {
                        customTime = free1650YTime!;
                      }
                      if (currentStroke == 'Freestyle' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '1500') {
                        customTime = free1500MTime!;
                      }
                      if (currentStroke == 'Backstroke' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '100') {
                        customTime = back100YTime!;
                      }
                      if (currentStroke == 'Backstroke' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '100') {
                        customTime = back100MTime!;
                      }
                      if (currentStroke == 'Backstroke' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '200') {
                        customTime = back200YTime!;
                      }
                      if (currentStroke == 'Backstroke' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '200') {
                        customTime = back200MTime!;
                      }
                      if (currentStroke == 'Breaststroke' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '100') {
                        customTime = brst100YTime!;
                      }
                      if (currentStroke == 'Breaststroke' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '100') {
                        customTime = brst100MTime!;
                      }
                      if (currentStroke == 'Breaststroke' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '200') {
                        customTime = brst200YTime!;
                      }
                      if (currentStroke == 'Breaststroke' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '200') {
                        customTime = brst200MTime!;
                      }
                      if (currentStroke == 'Butterfly' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '100') {
                        customTime = fly100YTime!;
                      }
                      if (currentStroke == 'Butterfly' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '100') {
                        customTime = fly100MTime!;
                      }
                      if (currentStroke == 'Butterfly' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '200') {
                        customTime = fly200YTime!;
                      }
                      if (currentStroke == 'Butterfly' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '200') {
                        customTime = fly200MTime!;
                      }
                      if (currentStroke == 'IM' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '200') {
                        customTime = im200YTime!;
                      }
                      if (currentStroke == 'IM' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '200') {
                        customTime = im200MTime!;
                      }
                      if (currentStroke == 'IM' &&
                          currentUnit == 'SCY' &&
                          currentYardage == '400') {
                        customTime = im400YTime!;
                      }
                      if (currentStroke == 'IM' &&
                          currentUnit == 'LCM' &&
                          currentYardage == '400') {
                        customTime = im400MTime!;
                      }
                    }
                    final goal = Goal(
                      id: id,
                      name: name,
                      unit: currentUnit,
                      distance: currentYardage,
                      stroke: currentStroke,
                      goalTime: goalTime,
                      currentTime: customTime,
                      needValue: calculateNeed(goalTime, customTime),
                      needPercentValue:
                          calculatePercentNeed(goalTime, customTime),
                    );
                    print(goal.stroke);
                    await GoalDatabase.instance.update(goal);
                    Navigator.pop(context);
                  }
                },
                child: Row(
                  children: [
                    Icon(Icons.check),
                    Text('Submit', style: TextStyle(color: Colors.white)),
                  ],
                ))
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('Goal Time',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    TextFormField(
                        initialValue: goalTime,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: 'mm:ss.ff',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          prefixIcon: Icon(
                            Icons.timer,
                            color: Colors.blueAccent,
                          ),
                          filled: true,
                          fillColor: Colors.blue[50],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Time is Required';
                          }
                          if (RegExp(r"\d?\d?\:?\d\d\.\d\d").hasMatch(value) ==
                              false) {
                            return 'Time format is invalid';
                          }
                        },
                        onSaved: (value) {
                          goalTime = value!;
                        }),
                    SizedBox(height: 20),
                    Transform.rotate(
                      angle: 90 * math.pi / 180,
                      child: Icon(Icons.compare_arrows, size: 35),
                    ),
                    SizedBox(height: 10),
                    Text('Compare to:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.fromLTRB(14, 6, 10, 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: _currentComparison,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: [
                            DropdownMenuItem(
                                child: Text('Current Time'),
                                value: 'Current Time'),
                            DropdownMenuItem(
                                child: Text('Custom'), value: 'Custom'),
                          ],
                          onChanged: (String? newValue) {
                            hasStarted = true;
                            setState(() {
                              _currentComparison = newValue!;

                              if (_currentComparison == 'Current Time') {
                                showInput = false;
                                customTime = '00:00.00';
                              } else if (_currentComparison == 'Custom') {
                                showInput = true;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: showInput,
                      child: TextFormField(
                          initialValue: customTime,
                          enabled: true,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'mm:ss.ff',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            prefixIcon: Icon(
                              Icons.timer,
                              color: Colors.blueAccent,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Time is Required';
                            }
                            if (RegExp(r"\d?\d?\:?\d\d\.\d\d")
                                    .hasMatch(value) ==
                                false) {
                              return 'Time format is invalid';
                            }
                          },
                          onSaved: (value) {
                            if (_currentComparison == 'Current Time') {
                              showInput = false;
                              customTime = '00:00.00';
                            } else {
                              customTime = value!;
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
