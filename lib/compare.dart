import 'package:flutter/material.dart';
import 'dart:math' as math;

class Compare extends StatefulWidget {
  String age = '';
  Compare(String age) {
    this.age = age;
  }

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  int timeConversion(String originalTime) {
    return 0;
  }

  @override
  void initState() {
    super.initState();
    print('Calling initState for Compare');
  }

  bool allowInput = false;
  String _currentUnit = 'SCY';
  String _currentYardage = '25';
  String _currentStroke = 'Freestyle';
  String _currentComparison = 'Current Time';
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

  @override
  Widget build(BuildContext context) {
    int age = int.parse(widget.age);

    // launching comparison dialog
    comparisonDialog(context) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Add Comparison'),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  width: double.maxFinite,
                  child: ListView(
                    children: [
                      Text('Unit'),
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
                      Text('Distance'),
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
                      Text('Stroke'),
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
                      SizedBox(height: 20),
                      Transform.rotate(
                        angle: 90 * math.pi / 180,
                        child: Icon(Icons.compare_arrows, size: 35),
                      ),
                      SizedBox(height: 10),
                      Text('Compare to:'),
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
                                  allowInput = false;
                                }
                                if (_currentComparison == 'Custom') {
                                  allowInput = true;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                          enabled: allowInput,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: 'Time',
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
                          },
                          onSaved: (value) {
                            _currentComparison = value!;
                          }),
                    ],
                  ),
                );
              }),
              actions: [
                MaterialButton(
                    child: Text('Submit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ]);
        },
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text('Click the button to add a time.'))],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          comparisonDialog(context);
        },
      ),
    );
  }
}
