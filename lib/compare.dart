import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swimstatsapp/goaltemplate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' as math;

// List of Goals
List<Goal> goalList = [];

class Compare extends StatefulWidget {
  String name = '';
  Compare(String name) {
    this.name = name;
  }

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  List<Goal> currentList = [];
  List<Goal> totalCurrentList = [];
  // Time Conversions to Seconds
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

  //
  ScrollController? controller;
  bool fabIsVisible = true;
  bool showIntro = true;

  @override
  void initState() {
    super.initState();
    print('Calling initState for Compare');

    controller = ScrollController();
    controller?.addListener(() {
      setState(() {
        fabIsVisible =
            controller?.position.userScrollDirection == ScrollDirection.forward;
      });
    });
    setState(() {
      for (int x = 0; x < goalList.length; x++) {
        if (goalList[x].name == widget.name) {
          totalCurrentList.add(goalList[x]);
        }
      }
      currentList = totalCurrentList;
      print(currentList);
    });
    if (totalCurrentList.isEmpty) {
      showIntro = true;
    } else {
      showIntro = false;
    }
  }

  //created global key, needed for form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  bool showInput = true;
  String _currentUnit = 'SCY';
  String _currentYardage = '25';
  String _currentStroke = 'Freestyle';
  String _currentComparison = 'Custom';
  String comparisonText = 'Current Time';
  String goalTime = '';
  String customTime = '';
  String newTime = '';
  double needValue = 0;
  double needPercentValue = 0;
  String initialSort = 'All';

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

  Widget goalTemplate(goal) {
    return Card(
      child: Column(
        children: [
          Text(goal.unit),
          Text(goal.distance),
          Text(goal.stroke),
          Text(goal.goalTime),
          Text(goal.currentTime),
          Text(goal.name),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.name;

    // launching comparison dialog
    comparisonDialog(context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Add Comparison'),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    child: ListView(
                      children: [
                        Text('Unit',
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
                              value: _currentUnit,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: [
                                DropdownMenuItem(
                                    child: Text('SCY'), value: 'SCY'),
                                DropdownMenuItem(
                                    child: Text('LCM'), value: 'LCM'),
                                DropdownMenuItem(
                                    child: Text('SCM'), value: 'SCM'),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  _currentUnit = newValue!;

                                  if (_currentUnit == 'SCY') {
                                    _currentYardage = '25';
                                    yardage = SCYyardage;
                                  }
                                  if (_currentUnit == 'SCM') {
                                    _currentYardage = '50';
                                    yardage = SCMyardage;
                                  }
                                  if (_currentUnit == 'LCM') {
                                    _currentYardage = '50';
                                    yardage = LCMyardage;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Distance',
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
                              value: _currentYardage,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: yardage.map((String event) {
                                return DropdownMenuItem(
                                    value: event, child: Text(event));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _currentYardage = newValue!;

                                  if (_currentYardage == '25') {
                                    stroke = twentyfiveevents;
                                    _currentStroke = 'Freestyle';
                                  }
                                  if (_currentYardage == '50') {
                                    stroke = fiftyevents;
                                    _currentStroke = 'Freestyle';
                                  }
                                  if (_currentYardage == '100') {
                                    stroke = hundredevents;
                                    _currentStroke = 'Freestyle';
                                  }
                                  if (_currentYardage == '200') {
                                    stroke = twohundredevents;
                                    _currentStroke = 'Freestyle';
                                  }
                                  if (_currentYardage == '400' &&
                                      _currentUnit == "LCM") {
                                    stroke = fourhundredeventslongcourse;
                                    _currentStroke = 'IM';
                                  }
                                  if (_currentYardage == '400' &&
                                      _currentUnit == "SCY") {
                                    stroke = fourhundredeventsshortcourse;
                                    _currentStroke = 'Freestyle';
                                  }
                                  if (_currentYardage == '800' ||
                                      _currentYardage == "1000") {
                                    stroke = eighthundredthousandevents;
                                    _currentStroke = 'Freestyle';
                                  }
                                  if (_currentYardage == '1500' ||
                                      _currentYardage == "1650") {
                                    stroke = mileevents;
                                    _currentStroke = 'Freestyle';
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Stroke',
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
                              value: _currentStroke,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: stroke.map((String stroke) {
                                return DropdownMenuItem(
                                    value: stroke, child: Text(stroke));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _currentStroke = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Goal Time',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: 'mm:ss.ff',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
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
                              if (RegExp(r"\d?\d?\:?\d\d\.\d\d")
                                      .hasMatch(value) ==
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
                              enabled: true,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                hintText: 'mm:ss.ff',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                );
              }),
              actions: [
                MaterialButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState!.validate() == true) {
                        _formKey.currentState!.save();
                        _currentUnit = 'SCY';

                        setState(() {
                          goalList.add(Goal(
                              _currentUnit,
                              _currentYardage,
                              _currentStroke,
                              goalTime,
                              customTime,
                              name,
                              calculateNeed(goalTime, customTime),
                              calculatePercentNeed(goalTime, customTime)));

                          totalCurrentList.add(Goal(
                              _currentUnit,
                              _currentYardage,
                              _currentStroke,
                              goalTime,
                              customTime,
                              name,
                              calculateNeed(goalTime, customTime),
                              calculatePercentNeed(goalTime, customTime)));

                          if (totalCurrentList.isEmpty) {
                            showIntro = true;
                          } else {
                            showIntro = false;
                          }
                          initialSort = 'All';
                        });

                        Navigator.of(context).pop();
                      }
                    }),
              ]);
        },
      );
    }

    //Change Data Dialogue
    changeDataDialog(context, Goal element) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Edit Comparison'),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    child: ListView(
                      children: [
                        Text('Unit',
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
                              value: element.unit,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: [
                                DropdownMenuItem(
                                    child: Text('SCY'), value: 'SCY'),
                                DropdownMenuItem(
                                    child: Text('LCM'), value: 'LCM'),
                                DropdownMenuItem(
                                    child: Text('SCM'), value: 'SCM'),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  element.unit = newValue!;

                                  if (element.unit == 'SCY') {
                                    element.distance = '25';
                                    yardage = SCYyardage;
                                  }
                                  if (element.unit == 'SCM') {
                                    element.distance = '50';
                                    yardage = SCMyardage;
                                  }
                                  if (element.unit == 'LCM') {
                                    element.distance = '50';
                                    yardage = LCMyardage;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Distance',
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
                              value: element.distance,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: yardage.map((String event) {
                                return DropdownMenuItem(
                                    value: event, child: Text(event));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  element.distance = newValue!;

                                  if (element.distance == '25') {
                                    stroke = twentyfiveevents;
                                    element.stroke = 'Freestyle';
                                  }
                                  if (element.distance == '50') {
                                    stroke = fiftyevents;
                                    element.stroke = 'Freestyle';
                                  }
                                  if (element.distance == '100') {
                                    stroke = hundredevents;
                                    element.stroke = 'Freestyle';
                                  }
                                  if (element.distance == '200') {
                                    stroke = twohundredevents;
                                    element.stroke = 'Freestyle';
                                  }
                                  if (element.distance == '400' &&
                                      _currentUnit == "LCM") {
                                    stroke = fourhundredeventslongcourse;
                                    element.stroke = 'IM';
                                  }
                                  if (element.distance == '400' &&
                                      _currentUnit == "SCY") {
                                    stroke = fourhundredeventsshortcourse;
                                    element.stroke = 'Freestyle';
                                  }
                                  if (element.distance == '800' ||
                                      _currentYardage == "1000") {
                                    stroke = eighthundredthousandevents;
                                    element.stroke = 'Freestyle';
                                  }
                                  if (element.distance == '1500' ||
                                      _currentYardage == "1650") {
                                    stroke = mileevents;
                                    element.stroke = 'Freestyle';
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Stroke',
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
                              value: element.stroke,
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: stroke.map((String stroke) {
                                return DropdownMenuItem(
                                    value: stroke, child: Text(stroke));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  element.stroke = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Goal Time',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        TextFormField(
                            initialValue: element.goalTime,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: 'mm:ss.ff',
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
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
                              if (RegExp(r"\d?\d?\:?\d\d\.\d\d")
                                      .hasMatch(value) ==
                                  false) {
                                return 'Time format is invalid';
                              }
                            },
                            onSaved: (value) {
                              element.goalTime = value!;
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
                                setState(() {
                                  _currentComparison = newValue!;

                                  if (_currentComparison == 'Current Time') {
                                    showInput = false;
                                    element.currentTime = '00:00.00';
                                  }
                                  if (_currentComparison == 'Custom') {
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
                              initialValue: element.currentTime,
                              enabled: true,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                hintText: 'mm:ss.ff',
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                                setState(() {
                                  element.currentTime = value!;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              actions: [
                MaterialButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState!.validate() == true) {
                        _formKey.currentState!.save();
                        _currentUnit = 'SCY';

                        setState(() {
                          element.needValue = calculateNeed(
                              element.goalTime, element.currentTime);
                          element.needPercentValue = calculatePercentNeed(
                              element.goalTime, element.currentTime);

                          if (totalCurrentList.isEmpty) {
                            showIntro = true;
                          } else {
                            showIntro = false;
                          }
                          initialSort = 'All';
                        });

                        Navigator.of(context).pop();
                      }
                    }),
              ]);
        },
      );
    }

    return Scaffold(
      body: ListView(
        controller: controller,
        children: <Widget>[
              Visibility(
                visible: showIntro,
                child: Center(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text('Click the button to add a goal.')),
                ),
              ),
              Visibility(
                visible: !showIntro,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                        DropdownMenuItem(child: Text('IM'), value: 'IM'),
                      ],
                      onChanged: (String? newValue) {
                        List<Goal> IMCurrentList = [];
                        List<Goal> freestyleCurrentList = [];
                        List<Goal> breaststrokeCurrentList = [];
                        List<Goal> backstrokeCurrentList = [];
                        List<Goal> butterflyCurrentList = [];
                        setState(() {
                          initialSort = newValue!;

                          if (initialSort == 'All') {
                            currentList = totalCurrentList;
                          }
                          if (initialSort == 'Freestyle') {
                            currentList = [];
                            for (int x = 0; x < totalCurrentList.length; x++) {
                              if (totalCurrentList[x].stroke == 'Freestyle') {
                                currentList.add(totalCurrentList[x]);
                              }
                            }
                          }
                          if (initialSort == 'Breaststroke') {
                            currentList = [];
                            for (int x = 0; x < totalCurrentList.length; x++) {
                              if (totalCurrentList[x].stroke ==
                                  'Breaststroke') {
                                currentList.add(totalCurrentList[x]);
                              }
                            }
                          }
                          if (initialSort == 'Backstroke') {
                            currentList = [];
                            for (int x = 0; x < totalCurrentList.length; x++) {
                              if (totalCurrentList[x].stroke == 'Backstroke') {
                                currentList.add(totalCurrentList[x]);
                              }
                            }
                          }
                          if (initialSort == 'Butterfly') {
                            currentList = [];
                            for (int x = 0; x < totalCurrentList.length; x++) {
                              if (totalCurrentList[x].stroke == 'Butterfly') {
                                currentList.add(totalCurrentList[x]);
                              }
                            }
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ] +
            currentList.map((element) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                          element.distance +
                              " " +
                              element.unit +
                              " " +
                              element.stroke,
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
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text(element.currentTime,
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
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                child: Text(element.goalTime,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ))),
                          ],
                        ),
                        if (element.needValue.isNegative == false)
                          Column(
                            children: [
                              Text('NEED',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Container(
                                  color: Colors.red[50],
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Text('✓',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                      ))),
                            ],
                          ),
                        if (element.needValue.isNegative == false)
                          Column(
                            children: [
                              Text('% NEED',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Container(
                                  color: Colors.red[50],
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Text('-${element.needPercentValue}%',
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
                                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
                            changeDataDialog(context, element);
                          },
                        ),
                        MaterialButton(
                            child: Text('DELETE'),
                            onPressed: () {
                              setState(() {
                                totalCurrentList
                                    .removeWhere((item) => item == element);
                                currentList
                                    .removeWhere((item) => item == element);
                                goalList.removeWhere((item) => item == element);
                                if (totalCurrentList.isEmpty) {
                                  showIntro = true;
                                } else {
                                  showIntro = false;
                                }
                              });
                              Fluttertoast.showToast(
                                msg: "Removed goal.",
                                backgroundColor: Colors.black.withOpacity(0.3),
                                textColor: Colors.white,
                              );
                            }),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
      ),
      floatingActionButton: AnimatedOpacity(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            comparisonDialog(context);
          },
        ),
        duration: Duration(milliseconds: 250),
        opacity: fabIsVisible ? 1 : 0,
      ),
    );
  }
}
