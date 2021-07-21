import 'package:flutter/material.dart';

import 'package:swimstatsapp/cardtemplate.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:fluttertoast/fluttertoast.dart';

// error dialog
errorDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          title: Text('Error'),
          content: Container(
            child: Row(
              children: [
                Flexible(
                    child: Text('Swimmer does not exist. Please try again.')),
              ],
            ),
          ),
          actions: [
            MaterialButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ]);
    },
  );
}

// String Manipulation

extension CapExtension on String {
  String get inCaps =>
      this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  DateTime backbuttonpressedTime = DateTime.now();
  // double click to exit
  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();
    bool backButton = backbuttonpressedTime == null ||
        currentTime.difference(backbuttonpressedTime) > Duration(seconds: 3);

    if (backButton) {
      backbuttonpressedTime = currentTime;
      Fluttertoast.showToast(
        msg: "Click again to exit app",
        backgroundColor: Colors.black.withOpacity(0.3),
        textColor: Colors.white,
      );
      return false;
    }
    return true;
  }

  List<SwimmerData> swimmerList = [];
  String _firstName = '';
  String _lastName = '';
  int swimmerIndex = 0;
  String swimmerAge = '';
  String swimmerClub = '';
  String swimmerGender = '';
  String swimmerLastMeet = '';
  String swimmerLastMeetDate = '';
  List meets = [];
  int swimmerintAge = 0;
  List meetTitles = [];
  String _date = '';

  String submitStatus = "Submit";

  createAddSwimmerDialog(BuildContext context) {
    String _currentRegion = 'aft';
    String _currentLSC = 'Florida';
    String currentLSCidentifier = '';

    List<String> lsc = [
      'Florida',
      'Florida Gold Coast',
      'Southeastern'
    ]; //initialize with first region

    DateTime _birthday = DateTime.now(); //just to have initial value
    String _birthdayMonth = '';
    String _birthdayDay = '';
    String _birthdayYear = '';
//created global key, needed for form
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    //using the _build naming convention for functions that return a widget
    Widget _buildFirstName() {
      return TextFormField(
          decoration: InputDecoration(
            hintText: 'First Name',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
            filled: true,
            fillColor: Colors.blue[50],
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'First Name is Required';
            }
          },
          onSaved: (value) {
            _firstName = value!;
            print(_firstName);
          });
    }

    Widget _buildLastName() {
      return TextFormField(
          decoration: InputDecoration(
            hintText: 'Last Name',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
            filled: true,
            fillColor: Colors.blue[50],
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Last Name is Required';
            }
          },
          onSaved: (value) {
            _lastName = value!;
          });
    }

    Widget _buildDateInput() {
      return TextFormField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            hintText: 'mm/dd/yyyy',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.5),
            ),
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Colors.blueAccent,
            ),
            filled: true,
            fillColor: Colors.blue[50],
          ),
          validator: (value) {
            if (RegExp(r"\d\d\/\d\d\/\d\d\d\d").hasMatch(value!) == false) {
              return 'Invalid date.';
            }
          },
          onSaved: (value) {
            _date = value!;
            print(_date);
            _birthdayMonth = _date.substring(0, 2);
            print(_birthdayMonth);
            _birthdayDay = _date.substring(3, 5);
            print(_birthdayDay);
            _birthdayYear = _date.substring(8, 10);
          });
    }

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add a Swimmer'),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Form(
                key: _formKey,
                child: Container(
                  width: double.maxFinite,
                  child: ListView(
                    // mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      _buildFirstName(),
                      SizedBox(height: 7),
                      _buildLastName(),
                      SizedBox(height: 20),
                      Text('Region',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
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
                            value: _currentRegion,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: [
                              DropdownMenuItem(
                                child: Text('Alabama - Florida - Tennessee'),
                                value: 'aft',
                              ),
                              DropdownMenuItem(
                                child: Text('Alaska'),
                                value: 'ak',
                              ),
                              DropdownMenuItem(
                                child: Text('Arizona'),
                                value: 'az',
                              ),
                              DropdownMenuItem(
                                child: Text('California - Nevada'),
                                value: 'cal',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                    'Colorado - New Mexico - Utah - Wyoming'),
                                value: 'cnw',
                              ),
                              DropdownMenuItem(
                                child:
                                    Text('Connecticut - Maine - New England'),
                                value: 'ne',
                              ),
                              DropdownMenuItem(
                                child: Text('D.C. - Maryland - Virginia'),
                                value: 'mdva',
                              ),
                              DropdownMenuItem(
                                child:
                                    Text('Delaware- New Jersey - Pennsylvania'),
                                value: 'dnp',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                    'Georgia - North Carolina - South Carolina'),
                                value: 'nc',
                              ),
                              DropdownMenuItem(
                                child: Text('Hawaii'),
                                value: 'hi',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                    'Idaho - Montana - Oregon - Washington'),
                                value: 'imow',
                              ),
                              DropdownMenuItem(
                                child: Text('Illinois - Iowa'),
                                value: 'ii',
                              ),
                              DropdownMenuItem(
                                child: Text('Indiana'),
                                value: 'in',
                              ),
                              DropdownMenuItem(
                                child: Text('Kentucky - West Virginia'),
                                value: 'kywv',
                              ),
                              DropdownMenuItem(
                                child: Text('Lake Erie - Michigan - Ohio'),
                                value: 'leoh',
                              ),
                              DropdownMenuItem(
                                child: Text('Lousiana - Mississippi'),
                                value: 'lams',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                    'Minnesota - North Dakota - South Dakota - Wisconsin'),
                                value: 'mmw',
                              ),
                              DropdownMenuItem(
                                child: Text('New York'),
                                value: 'ny',
                              ),
                              DropdownMenuItem(
                                child: Text('Texas'),
                                value: 'tx',
                              ),
                              DropdownMenuItem(
                                child: Text(
                                    'Arkansas - Kansas - Missouri - Nebraska - Oklahoma'),
                                value: 'kmno',
                              ),
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                _currentRegion = newValue!;

                                if (_currentRegion == 'aft') {
                                  setState(() {
                                    lsc = [
                                      'Florida',
                                      'Florida Gold Coast',
                                      'Southeastern'
                                    ];
                                    _currentLSC = 'Florida';
                                  });
                                }
                                if (_currentRegion == 'ak') {
                                  setState(() {
                                    lsc = ['Alaska', 'None'];
                                    _currentLSC = 'Alaska';
                                  });
                                }
                                if (_currentRegion == 'az') {
                                  setState(() {
                                    lsc = ['Arizona', 'None'];
                                    _currentLSC = 'Arizona';
                                  });
                                }
                                if (_currentRegion == 'cal') {
                                  setState(() {
                                    lsc = [
                                      'Southern California',
                                      'Pacific',
                                      'San Diego - Imperial',
                                      'Central',
                                      'Sierra Nevada'
                                    ];
                                    _currentLSC = 'Southern California';
                                  });
                                }
                                if (_currentRegion == 'cnw') {
                                  setState(() {
                                    lsc = [
                                      'Colorado',
                                      'New Mexico',
                                      'Utah',
                                      'Wyoming'
                                    ];
                                    _currentLSC = 'Colorado';
                                  });
                                }
                                if (_currentRegion == 'ne') {
                                  setState(() {
                                    lsc = [
                                      'Connecticut',
                                      'Maine',
                                      'New England'
                                    ];
                                    _currentLSC = 'Connecticut';
                                  });
                                }
                                if (_currentRegion == 'mdva') {
                                  setState(() {
                                    lsc = [
                                      'Maryland',
                                      'Potomac Valley',
                                      'Virginia'
                                    ];
                                    _currentLSC = 'Maryland';
                                  });
                                }
                                if (_currentRegion == 'dnp') {
                                  setState(() {
                                    lsc = [
                                      'Allegheny Mountain',
                                      'Mid Atlantic',
                                      'New Jersey'
                                    ];
                                    _currentLSC = 'Allegheny Mountain';
                                  });
                                }
                                if (_currentRegion == 'nc') {
                                  setState(() {
                                    lsc = [
                                      'Georgia',
                                      'North Carolina',
                                      'South Carolina'
                                    ];
                                    _currentLSC = 'Georgia';
                                  });
                                }
                                if (_currentRegion == 'hi') {
                                  setState(() {
                                    lsc = ['Hawaii', 'None'];
                                    _currentLSC = 'Hawaii';
                                  });
                                }
                                if (_currentRegion == 'imow') {
                                  setState(() {
                                    lsc = [
                                      'Inland Empire',
                                      'Montana',
                                      'Oregon',
                                      'Pacific Northwest',
                                      'Snake River'
                                    ];
                                    _currentLSC = 'Inland Empire';
                                  });
                                }
                                if (_currentRegion == 'ii') {
                                  setState(() {
                                    lsc = ['Illinois', 'Iowa'];
                                    _currentLSC = 'Illinois';
                                  });
                                }
                                if (_currentRegion == 'in') {
                                  setState(() {
                                    lsc = ['Indiana', 'None'];
                                    _currentLSC = 'Indiana';
                                  });
                                }
                                if (_currentRegion == 'kywv') {
                                  setState(() {
                                    lsc = ['Kentucky', 'West Virginia'];
                                    _currentLSC = 'Kentucky';
                                  });
                                }
                                if (_currentRegion == 'leoh') {
                                  setState(() {
                                    lsc = ['Lake Erie', 'Michigan', 'Ohio'];
                                    _currentLSC = 'Lake Erie';
                                  });
                                }
                                if (_currentRegion == 'lams') {
                                  setState(() {
                                    lsc = ['Louisiana', 'Mississippi'];
                                    _currentLSC = 'Louisiana';
                                  });
                                }
                                if (_currentRegion == 'mmw') {
                                  setState(() {
                                    lsc = [
                                      'Minnesota',
                                      'North Dakota',
                                      'South Dakota',
                                      'Wisconsin'
                                    ];
                                    _currentLSC = 'Minnesota';
                                  });
                                }
                                if (_currentRegion == 'ny') {
                                  setState(() {
                                    lsc = [
                                      'Adirondack',
                                      'Metropolitan',
                                      'Niagara'
                                    ];
                                    _currentLSC = 'Adirondack';
                                  });
                                }
                                if (_currentRegion == 'tx') {
                                  setState(() {
                                    lsc = [
                                      'Border',
                                      'Gulf',
                                      'North Texas',
                                      'South Texas',
                                      'West Texas'
                                    ];
                                    _currentLSC = 'Border';
                                  });
                                }
                                if (_currentRegion == 'kmno') {
                                  setState(() {
                                    lsc = [
                                      'Arkansas',
                                      'Missouri Valley',
                                      'Oklahoma',
                                      'Midwestern',
                                      'Ozark'
                                    ];
                                    _currentLSC = 'Arkansas';
                                  });
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      // sizedBox just to add more space
                      SizedBox(height: 20),
                      Text('Local Swim Committee',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),

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
                            value: _currentLSC,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: lsc.map((String lsc) {
                              return DropdownMenuItem(
                                  value: lsc, child: Text(lsc));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _currentLSC = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Birthday Date',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),

                      _buildDateInput(),

                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.info, color: Colors.blueAccent),
                            onPressed: () {
                              Navigator.pushNamed(context, '/privacypolicy');
                            },
                          ),
                          SizedBox(width: 10),
                          Flexible(
                              child: Text(
                                  'SwimStats never stores any of your data. Click the icon to read our privacy policy.')),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            actions: [
              MaterialButton(
                child: Text('Submit'),
                onPressed: () async {
                  if (_formKey.currentState!.validate() == true) {
                    _formKey.currentState!.save();

                    int birthdayYearFirst =
                        int.parse(_birthdayYear.substring(0, 1));
                    print(birthdayYearFirst);

                    int birthdayYearSecond =
                        int.parse(_birthdayYear.substring(1, 2));
                    print(birthdayYearSecond);

                    // //creating usable LSC output
                    if (_currentLSC == 'Florida') {
                      currentLSCidentifier = 'fl';
                    }
                    if (_currentLSC == 'Florida Gold Coast') {
                      currentLSCidentifier = 'fg';
                    }
                    if (_currentLSC == 'Southeastern') {
                      currentLSCidentifier = 'se';
                    }
                    if (_currentLSC == 'Alaska') {
                      currentLSCidentifier = 'ak';
                    }
                    if (_currentLSC == 'Arizona') {
                      currentLSCidentifier = 'az';
                    }
                    if (_currentLSC == 'Southern California') {
                      currentLSCidentifier = 'scs';
                    }
                    if (_currentLSC == 'Pacific') {
                      currentLSCidentifier = 'pc';
                    }
                    if (_currentLSC == 'San Diego - Imperial') {
                      currentLSCidentifier = 'si';
                    }
                    if (_currentLSC == 'Central') {
                      currentLSCidentifier = 'cc';
                    }
                    if (_currentLSC == 'Sierra Nevada') {
                      currentLSCidentifier = 'sn';
                    }
                    if (_currentLSC == 'Colorado') {
                      currentLSCidentifier = 'co';
                    }
                    if (_currentLSC == 'New Mexico') {
                      currentLSCidentifier = 'nm';
                    }
                    if (_currentLSC == 'Utah') {
                      currentLSCidentifier = 'ut';
                    }
                    if (_currentLSC == 'Wyoming') {
                      currentLSCidentifier = 'wy';
                    }
                    if (_currentLSC == 'Connecticut') {
                      currentLSCidentifier = 'ct';
                    }
                    if (_currentLSC == 'Maine') {
                      currentLSCidentifier = 'me';
                    }
                    if (_currentLSC == 'New England') {
                      currentLSCidentifier = 'ne';
                    }
                    if (_currentLSC == 'Maryland') {
                      currentLSCidentifier = 'md';
                    }
                    if (_currentLSC == 'Potomac Valley') {
                      currentLSCidentifier = 'pv';
                    }
                    if (_currentLSC == 'Virginia') {
                      currentLSCidentifier = 'va';
                    }
                    if (_currentLSC == 'Allegheny Mountain') {
                      currentLSCidentifier = 'am';
                    }
                    if (_currentLSC == 'Mid Atlantic') {
                      currentLSCidentifier = 'ma';
                    }
                    if (_currentLSC == 'New Jersey') {
                      currentLSCidentifier = 'nj';
                    }
                    if (_currentLSC == 'Georgia') {
                      currentLSCidentifier = 'ga';
                    }
                    if (_currentLSC == 'North Carolina') {
                      currentLSCidentifier = 'nc';
                    }
                    if (_currentLSC == 'South Carolina') {
                      currentLSCidentifier = 'fl';
                    }
                    if (_currentLSC == 'Hawaii') {
                      currentLSCidentifier = 'hi';
                    }
                    if (_currentLSC == 'Inland Empire') {
                      currentLSCidentifier = 'ie';
                    }
                    if (_currentLSC == 'Montana') {
                      currentLSCidentifier = 'mt';
                    }
                    if (_currentLSC == 'Oregon') {
                      currentLSCidentifier = 'or';
                    }
                    if (_currentLSC == 'Pacific Northwest') {
                      currentLSCidentifier = 'pn';
                    }
                    if (_currentLSC == 'Snake River') {
                      currentLSCidentifier = 'sr';
                    }
                    if (_currentLSC == 'Illinois') {
                      currentLSCidentifier = 'il';
                    }
                    if (_currentLSC == 'Iowa') {
                      currentLSCidentifier = 'ia';
                    }
                    if (_currentLSC == 'Indiana') {
                      currentLSCidentifier = 'in';
                    }
                    if (_currentLSC == 'Kentucky') {
                      currentLSCidentifier = 'ky';
                    }
                    if (_currentLSC == 'West Virginia') {
                      currentLSCidentifier = 'wv';
                    }
                    if (_currentLSC == 'Lake Erie') {
                      currentLSCidentifier = 'fl';
                    }
                    if (_currentLSC == 'Michigan') {
                      currentLSCidentifier = 'mi';
                    }
                    if (_currentLSC == 'Ohio') {
                      currentLSCidentifier = 'oh';
                    }
                    if (_currentLSC == 'Louisiana') {
                      currentLSCidentifier = 'la';
                    }
                    if (_currentLSC == 'Mississippi') {
                      currentLSCidentifier = 'ms';
                    }
                    if (_currentLSC == 'Minnesota') {
                      currentLSCidentifier = 'mn';
                    }
                    if (_currentLSC == 'North Dakota') {
                      currentLSCidentifier = 'nd';
                    }
                    if (_currentLSC == 'South Dakota') {
                      currentLSCidentifier = 'sd';
                    }
                    if (_currentLSC == 'Wisconsin') {
                      currentLSCidentifier = 'wi';
                    }
                    if (_currentLSC == 'Adirondack') {
                      currentLSCidentifier = 'ad';
                    }
                    if (_currentLSC == 'Metropolitan') {
                      currentLSCidentifier = 'mr';
                    }
                    if (_currentLSC == 'Niagara') {
                      currentLSCidentifier = 'ni';
                    }
                    if (_currentLSC == 'Border') {
                      currentLSCidentifier = 'bd';
                    }
                    if (_currentLSC == 'Gulf') {
                      currentLSCidentifier = 'gu';
                    }
                    if (_currentLSC == 'North Texas') {
                      currentLSCidentifier = 'nt';
                    }
                    if (_currentLSC == 'South Texas') {
                      currentLSCidentifier = 'st';
                    }
                    if (_currentLSC == 'West Texas') {
                      currentLSCidentifier = 'wt';
                    }
                    if (_currentLSC == 'Arkansas') {
                      currentLSCidentifier = 'ar';
                    }
                    if (_currentLSC == 'Missouri Valley') {
                      currentLSCidentifier = 'mv';
                    }
                    if (_currentLSC == 'Oklahoma') {
                      currentLSCidentifier = 'ok';
                    }
                    if (_currentLSC == 'Midwestern') {
                      currentLSCidentifier = 'mw';
                    }
                    if (_currentLSC == 'Ozark') {
                      currentLSCidentifier = 'oz';
                    }

                    //using index of array to correspond to value
                    List letter = [
                      'A',
                      'B',
                      'C',
                      'D',
                      'E',
                      'F',
                      'G',
                      'H',
                      'I',
                      'J',
                      'K',
                      'L',
                      'M',
                      'O',
                      'P',
                      'Q',
                      'R',
                      'S',
                      'T',
                      'U',
                      'V',
                      'W',
                      'X',
                      'Y',
                      'Z',
                      '0',
                      '1',
                      '2',
                      '3',
                      '4',
                      '5'
                    ];

                    int birthdayMonth = int.parse(_birthdayMonth);
                    int birthdayDay = int.parse(_birthdayDay);
                    String firstLetter =
                        _firstName.substring(0, 1).toUpperCase();

                    String secondLetter = letter[birthdayMonth];

                    String thirdLetter =
                        _firstName.substring(1, 2).toUpperCase();

                    String fourthLetter = letter[birthdayDay];

                    String fifthLetter =
                        _firstName.substring(2, 3).toUpperCase();

                    String sixthLetter = letter[birthdayYearFirst];

                    String seventhLetter =
                        _lastName.substring(0, 1).toUpperCase();

                    String eigthLetter = letter[birthdayYearSecond];

                    String ninthLetter =
                        _lastName.substring(1, 2).toUpperCase();

                    String swimmerIdentifier = firstLetter +
                        secondLetter +
                        thirdLetter +
                        fourthLetter +
                        fifthLetter +
                        sixthLetter +
                        seventhLetter +
                        eigthLetter +
                        ninthLetter;

                    String fullUrl = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_meets.html";
                    print(fullUrl);

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

                    String free50Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_50FR.html";
                    print(fullUrl);
                    final free50Scrap = WebScraper('https://swimmingrank.com');
                    if (await free50Scrap.loadWebPage('$free50Url')) {
                      List<Map<String, dynamic>> elements = free50Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          free50YTime = elements[7]['title'];
                          free50MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          free50YTime = elements[7]['title'];
                          free50MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          free50YTime = 'N/A';
                          free50MTime = elements[12]['title'];
                        } else {
                          free50YTime = 'N/A';
                          free50MTime = 'N/A';
                        }
                      });
                      print('free ' + free50YTime);
                      print('free ' + free50MTime);
                      times.replaceRange(
                          3, 6, [free50MTime, '50 Freestyle', free50YTime]);
                    }

                    String free100Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_100FR.html";
                    print(fullUrl);
                    final free100Scrap = WebScraper('https://swimmingrank.com');
                    if (await free100Scrap.loadWebPage('$free100Url')) {
                      List<Map<String, dynamic>> elements = free100Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          free100YTime = elements[7]['title'];
                          free100MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          free100YTime = elements[7]['title'];
                          free100MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          free100YTime = 'N/A';
                          free100MTime = elements[12]['title'];
                        } else {
                          free100YTime = 'N/A';
                          free100MTime = 'N/A';
                        }
                      });
                      print('free ' + free100YTime);
                      print('free' + free100MTime);
                      times.replaceRange(
                          6, 9, [free100MTime, '100 Freestyle', free100YTime]);
                    }

                    String free200Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_200FR.html";
                    print(fullUrl);
                    final free200Scrap = WebScraper('https://swimmingrank.com');
                    if (await free200Scrap.loadWebPage('$free200Url')) {
                      List<Map<String, dynamic>> elements = free200Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          free200YTime = elements[7]['title'];
                          free200MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          free200YTime = elements[7]['title'];
                          free200MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          free200YTime = 'N/A';
                          free200MTime = elements[12]['title'];
                        } else {
                          free200YTime = 'N/A';
                          free200MTime = 'N/A';
                        }
                      });
                      print('free' + free200YTime);
                      print('free' + free200MTime);
                      times.replaceRange(
                          9, 12, [free200MTime, '200 Freestyle', free200YTime]);
                    }

                    String free400Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_400500FR.html";
                    final free400Scrap = WebScraper('https://swimmingrank.com');
                    if (await free400Scrap.loadWebPage('$free400Url')) {
                      List<Map<String, dynamic>> elements = free400Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          free500YTime = elements[7]['title'];
                          free400MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          free500YTime = elements[7]['title'];
                          free400MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          free500YTime = 'N/A';
                          free400MTime = elements[12]['title'];
                        } else {
                          free500YTime = 'N/A';
                          free400MTime = 'N/A';
                        }
                      });
                      print('free' + free500YTime);
                      print('free' + free400MTime);
                      times.replaceRange(12, 15,
                          [free400MTime, '400/500 Freestyle', free500YTime]);
                    }

                    String free800Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_8001000FR.html";
                    final free800Scrap = WebScraper('https://swimmingrank.com');
                    if (await free800Scrap.loadWebPage('$free800Url')) {
                      List<Map<String, dynamic>> elements = free800Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          free1000YTime = elements[7]['title'];
                          free800MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          free1000YTime = elements[7]['title'];
                          free800MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          free1000YTime = 'N/A';
                          free800MTime = elements[12]['title'];
                        } else {
                          free1000YTime = 'N/A';
                          free800MTime = 'N/A';
                        }
                      });
                      print('free ' + free1000YTime);
                      print('free ' + free800MTime);
                      times.replaceRange(15, 18,
                          [free800MTime, '800/1000 Freestyle', free1000YTime]);
                    }

                    String free1500Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_15001650FR.html";
                    final free1500Scrap =
                        WebScraper('https://swimmingrank.com');
                    if (await free1500Scrap.loadWebPage('$free1500Url')) {
                      List<Map<String, dynamic>> elements = free1500Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          free1650YTime = elements[7]['title'];
                          free1500MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          free1650YTime = elements[7]['title'];
                          free1500MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          free1650YTime = 'N/A';
                          free1500MTime = elements[12]['title'];
                        } else {
                          free1650YTime = 'N/A';
                          free1500MTime = 'N/A';
                        }
                      });
                      print('free ' + free1650YTime);
                      print('free ' + free1500MTime);
                      times.replaceRange(18, 21, [
                        free1500MTime,
                        '1500/1650 Freestyle',
                        free1650YTime
                      ]);
                    }

                    String back100Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_100BK.html";
                    final back100Scrap = WebScraper('https://swimmingrank.com');
                    if (await back100Scrap.loadWebPage('$back100Url')) {
                      List<Map<String, dynamic>> elements = back100Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          back100YTime = elements[7]['title'];
                          back100MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          back100YTime = elements[7]['title'];
                          back100MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          back100YTime = 'N/A';
                          back100MTime = elements[12]['title'];
                        } else {
                          back100YTime = 'N/A';
                          back100MTime = 'N/A';
                        }
                      });
                      print('back' + back100YTime);
                      print('back' + back100MTime);
                      times.replaceRange(21, 24,
                          [back100MTime, '100 Backstroke', back100YTime]);
                    }

                    String back200Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_200BK.html";
                    final back200Scrap = WebScraper('https://swimmingrank.com');
                    if (await back200Scrap.loadWebPage('$back200Url')) {
                      List<Map<String, dynamic>> elements = back200Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          back200YTime = elements[7]['title'];
                          back200MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          back200YTime = elements[7]['title'];
                          back200MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          back200YTime = 'N/A';
                          back200MTime = elements[12]['title'];
                        } else {
                          back200YTime = 'N/A';
                          back200MTime = 'N/A';
                        }
                      });
                      print('back' + back200YTime);
                      print('back' + back200MTime);
                      times.replaceRange(24, 27,
                          [back200MTime, '200 Backstroke', back200YTime]);
                    }

                    String brst100Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_100BR.html";
                    final brst100Scrap = WebScraper('https://swimmingrank.com');
                    if (await brst100Scrap.loadWebPage('$brst100Url')) {
                      List<Map<String, dynamic>> elements = brst100Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          brst100YTime = elements[7]['title'];
                          brst100MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          brst100YTime = elements[7]['title'];
                          brst100MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          brst100YTime = 'N/A';
                          brst100MTime = elements[12]['title'];
                        } else {
                          brst100YTime = 'N/A';
                          brst100MTime = 'N/A';
                        }
                      });
                      print('brst' + brst100YTime);
                      print('brst' + brst100MTime);
                      times.replaceRange(27, 30,
                          [brst100MTime, '100 Breaststroke', brst100YTime]);
                    }

                    String brst200Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_200BR.html";
                    final brst200Scrap = WebScraper('https://swimmingrank.com');
                    if (await brst200Scrap.loadWebPage('$brst200Url')) {
                      List<Map<String, dynamic>> elements = brst200Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          brst200YTime = elements[7]['title'];
                          brst200MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          brst200YTime = elements[7]['title'];
                          brst200MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          brst200YTime = 'N/A';
                          brst200MTime = elements[12]['title'];
                        } else {
                          brst200YTime = 'N/A';
                          brst200MTime = 'N/A';
                        }
                      });
                      print('brst' + brst200YTime);
                      print('brst' + brst200MTime);
                      times.replaceRange(30, 33,
                          [brst200MTime, '200 Breaststroke', brst200YTime]);
                    }

                    String fly100Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_100FL.html";
                    final fly100Scrap = WebScraper('https://swimmingrank.com');
                    if (await fly100Scrap.loadWebPage('$fly100Url')) {
                      List<Map<String, dynamic>> elements = fly100Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          fly100YTime = elements[7]['title'];
                          fly100MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          fly100YTime = elements[7]['title'];
                          fly100MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          fly100YTime = 'N/A';
                          fly100MTime = elements[12]['title'];
                        } else {
                          fly100YTime = 'N/A';
                          fly100MTime = 'N/A';
                        }
                      });
                      print('fly ' + fly100YTime);
                      print('fly' + fly100MTime);
                      times.replaceRange(
                          33, 36, [fly100MTime, '100 Butterfly', fly100YTime]);
                    }

                    String fly200Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_200FL.html";
                    final fly200Scrap = WebScraper('https://swimmingrank.com');
                    if (await fly200Scrap.loadWebPage('$fly200Url')) {
                      List<Map<String, dynamic>> elements = fly200Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          fly200YTime = elements[7]['title'];
                          fly200MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          fly200YTime = elements[7]['title'];
                          fly200MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          fly200YTime = 'N/A';
                          fly200MTime = elements[12]['title'];
                        } else {
                          fly200YTime = 'N/A';
                          fly200MTime = 'N/A';
                        }
                      });
                      print('fly' + fly200YTime);
                      print('fly' + fly200MTime);
                      times.replaceRange(
                          36, 39, [fly200MTime, '200 Butterfly', fly200YTime]);
                    }

                    String im200Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_200IM.html";
                    final im200Scrap = WebScraper('https://swimmingrank.com');
                    if (await im200Scrap.loadWebPage('$im200Url')) {
                      List<Map<String, dynamic>> elements = im200Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          im200YTime = elements[7]['title'];
                          im200MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          im200YTime = elements[7]['title'];
                          im200MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          im200YTime = 'N/A';
                          im200MTime = elements[12]['title'];
                        } else {
                          im200YTime = 'N/A';
                          im200MTime = 'N/A';
                        }
                      });
                      print('IM' + im200YTime);
                      print('IM' + im200MTime);
                      times.replaceRange(
                          39, 42, [im200MTime, '200 IM', im200YTime]);
                    }

                    String im400Url = "/" +
                        _currentRegion +
                        "/strokes/strokes_" +
                        currentLSCidentifier +
                        "/" +
                        swimmerIdentifier +
                        "_400IM.html";
                    final im400Scrap = WebScraper('https://swimmingrank.com');
                    if (await im400Scrap.loadWebPage('$im400Url')) {
                      List<Map<String, dynamic>> elements = im400Scrap
                          .getElement('body > div > table > tbody > tr > td',
                              ['title']);
                      setState(() {
                        if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == true) {
                          im400YTime = elements[7]['title'];
                          im400MTime = elements[12]['title'];
                        } else if (elements[7]['title'].contains('.') == true &&
                            elements[12]['title'].contains('.') == false) {
                          im400YTime = elements[7]['title'];
                          im400MTime = 'N/A';
                        } else if (elements[7]['title'].contains('.') ==
                                false &&
                            elements[12]['title'].contains('.') == true) {
                          im400YTime = 'N/A';
                          im400MTime = elements[12]['title'];
                        } else {
                          im400YTime = 'N/A';
                          im400MTime = 'N/A';
                        }
                      });
                      print('IM' + im400YTime);
                      print('IM' + im400MTime);
                      times.replaceRange(
                          42, 45, [im400MTime, '400 IM', im400YTime]);
                    }

                    //parsing information from the website

                    final swimmerPage =
                        WebScraper("https://www.swimmingrank.com");

                    try {
                      // scraping swimmer age
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td.ui-helper-center', ['']);
                        swimmerAge = elements[2]['title'];
                      }
                      // scraping swimmer club
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td > button', ['']);
                        swimmerClub = elements[0]['title'];
                      }
                      //scraping swimmer gender
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td.ui-helper-center', ['']);
                        swimmerGender = elements[3]['title'];
                      }
                      //scraping swimmer's last swim meet
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('th', ['']);
                        swimmerLastMeet = elements[5]['title'];
                      }

                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('th', ['']);
                        swimmerLastMeetDate = elements[6]['title'];
                        swimmerintAge = int.parse(swimmerAge);
                      }
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        meets = swimmerPage.getElementTitle('tr');
                        meets.removeRange(0, 5);
                        meets.removeWhere((item) => item == meets[2]);
                        meets.removeLast();

                        setState(() {
                          swimmerList.add(SwimmerData(
                              _firstName.capitalizeFirstofEach +
                                  " " +
                                  _lastName.capitalizeFirstofEach,
                              swimmerIndex,
                              fullUrl,
                              swimmerAge,
                              swimmerClub,
                              swimmerGender,
                              swimmerLastMeet,
                              swimmerLastMeetDate.substring(0, 10),
                              swimmerIdentifier,
                              swimmerintAge,
                              fullUrl,
                              meets,
                              free50YTime,
                              free50MTime,
                              free100YTime,
                              free100MTime,
                              free200YTime,
                              free200MTime,
                              free500YTime,
                              free400MTime,
                              free1000YTime,
                              free800MTime,
                              free1650YTime,
                              free1500MTime,
                              back100YTime,
                              back100MTime,
                              back200YTime,
                              back200MTime,
                              brst100YTime,
                              brst100MTime,
                              brst200YTime,
                              brst200MTime,
                              fly100YTime,
                              fly100MTime,
                              fly200YTime,
                              fly200MTime,
                              im200YTime,
                              im200MTime,
                              im400YTime,
                              im400MTime));
                        });

                        Navigator.pop(context);

                        swimmerIndex++;
                      }
                    } catch (e) {
                      print('Invalid!');
                      errorDialog(context);
                    }
                  }
                },
              ),
            ],
          );
        });
  }

  // remove swimmer dialog
  createRemoveSwimmerDialog(context, swimmer) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text('Remove Swimmer?'),
            content: Row(
              children: [
                Text('Selected: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text(swimmer.name),
              ],
            ),
            actions: [
              MaterialButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              MaterialButton(
                child: Text('Delete'),
                onPressed: () {
                  setState(() {
                    swimmerList.removeAt(swimmer.index);
                    for (int x = 0; x < swimmerList.length; x++) {
                      swimmerList[x].index = x;
                    }
                    swimmerIndex = swimmerList.length;
                    Navigator.pop(context);
                  });
                },
              ),
            ]);
      },
    );
  }

  // error dialog

  //swimmer template
  Widget swimmerTemplate(swimmer) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/swimmerinfo', arguments: {
          'swimmer': swimmer,
        });
      },
      onLongPress: () {
        createRemoveSwimmerDialog(context, swimmer);
      },
      // Content displayed on the Card
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${swimmer.index}'),
                  SizedBox(width: 20),
                  if (swimmer.gender == "Male")
                    Text(swimmer.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        )),
                  if (swimmer.gender == "Female")
                    Text(swimmer.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        )),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text('Age: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text('${swimmer.age} '),
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${swimmer.identifier}',
                    style: TextStyle(
                      fontSize: 7,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Team: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${swimmer.club}',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last Meet: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${swimmer.lastMeet} (${swimmer.lastMeetDate})',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select a Swimmer'),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              onSelected: (item) {
                if (item == 0) {
                  Navigator.pushNamed(context, '/howtouse');
                }
                if (item == 1) {
                  Navigator.pushNamed(context, '/about');
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(Icons.list, color: Colors.black),
                      ),
                      TextSpan(
                          text: '   How to Use',
                          style: TextStyle(color: Colors.black)),
                    ]),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: RichText(
                    text: TextSpan(children: [
                      WidgetSpan(
                        child: Icon(Icons.info_outline_rounded,
                            color: Colors.black),
                      ),
                      TextSpan(
                          text: '   About',
                          style: TextStyle(color: Colors.black)),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: WillPopScope(
          onWillPop: onWillPop,
          child: Builder(
            builder: (context) => RefreshIndicator(
              displacement: 10,
              onRefresh: () async {
                ScaffoldMessengerState scaffoldMessenger =
                    ScaffoldMessenger.of(context);
                for (int x = 0; x < swimmerList.length; x++) {
                  final rootPage = WebScraper("https://www.swimmingrank.com");
                  // scraping swimmer age
                  try {
                    if (await rootPage.loadWebPage(swimmerList[x].url)) {
                      List<Map<String, dynamic>> elements =
                          rootPage.getElement('td.ui-helper-center', ['']);
                      setState(() {
                        swimmerList[x].age = elements[2]['title'];
                        print('Success');
                      });
                    }
                  } catch (e) {
                    print('Failure');
                    scaffoldMessenger.showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.red[50],
                      content: Row(
                        children: [
                          Icon(Icons.check, color: Colors.red),
                          SizedBox(width: 10),
                          Text('Error: No internet connection.',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ));
                  }
                  // scraping swimmer club
                  try {
                    if (await rootPage.loadWebPage(swimmerList[x].url)) {
                      List<Map<String, dynamic>> elements =
                          rootPage.getElement('td > button', ['']);
                      setState(() {
                        swimmerList[x].club = elements[0]['title'];
                        print('Success');
                      });
                    }
                  } catch (e) {
                    print('Failure');
                  }
                  //scraping swimmer gender
                  try {
                    if (await rootPage.loadWebPage(swimmerList[x].url)) {
                      List<Map<String, dynamic>> elements =
                          rootPage.getElement('td.ui-helper-center', ['']);
                      setState(() {
                        swimmerList[x].gender = elements[3]['title'];
                        print('Success');
                      });
                    }
                  } catch (e) {
                    print('Failure');
                  }
                  //scraping swimmer's last swim meet
                  try {
                    if (await rootPage.loadWebPage(swimmerList[x].url)) {
                      List<Map<String, dynamic>> elements =
                          rootPage.getElement('th', ['']);
                      setState(() {
                        swimmerList[x].lastMeet = elements[5]['title'];
                        print('Success');
                      });
                    }
                  } catch (e) {
                    print('Failure');
                  }
                  try {
                    if (await rootPage.loadWebPage(swimmerList[x].url)) {
                      List<Map<String, dynamic>> elements =
                          rootPage.getElement('th', ['']);
                      setState(() {
                        swimmerList[x].lastMeetDate =
                            elements[6]['title'].substring(0, 10);
                        print('Success');
                      });
                    }
                  } catch (e) {
                    print('Failure');
                  }
                  try {
                    if (await rootPage.loadWebPage(swimmerList[x].url)) {
                      meets = rootPage.getElementTitle('tr');
                      meets.removeRange(0, 5);
                      meets.removeWhere((item) => item == meets[2]);
                      meets.removeLast();
                      scaffoldMessenger.showSnackBar(SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green[50],
                        content: Row(
                          children: [
                            Icon(Icons.check, color: Colors.green),
                            SizedBox(width: 10),
                            Text('Successfully refreshed swimmer.',
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ));
                    }
                  } catch (e) {
                    print('Failure');
                  }
                }
              },
              child: ListView(
                children: [
                  if (swimmerList.isEmpty)
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                      child: Column(
                        children: [
                          Text('No swimmers added yet.'),
                          SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: 'Add a swimmer by clicking the '),
                                WidgetSpan(
                                  child: Icon(Icons.menu),
                                ),
                                TextSpan(
                                    style: TextStyle(color: Colors.black),
                                    text: ' button below.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                  else
                    Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: swimmerList
                              .map((swimmer) => swimmerTemplate(swimmer))
                              .toList()),
                    ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
          label: Text('Menu'),
          marginEnd: 18,
          marginBottom: 20,
          icon: Icons.menu,
          activeIcon: Icons.close,
          buttonSize: 56,
          visible: true,
          closeManually: false,
          renderOverlay: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.3,
          onOpen: () => print('Opened'),
          onClose: () => print('Closed'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.blue[400],
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.add),
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue[400],
              label: 'Add New Swimmer',
              labelStyle: TextStyle(
                fontSize: 18.0,
              ),
              onTap: () => createAddSwimmerDialog(context),
              onLongPress: () => print('FIRST CHILD LONG PRESS'),
            ),
          ],
        ),
      ),
    );
  }
}
