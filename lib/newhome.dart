import 'package:flutter/material.dart';
import 'package:swimstatsapp/main.dart';
import 'package:swimstatsapp/cardtemplate.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:web_scraper/web_scraper.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  List<SwimmerData> swimmerList = [];
  String _firstName = '';
  String _lastName = '';
  int swimmerIndex = 0;
  String swimmerAge = '';
  String swimmerClub = '';
  String swimmerGender = '';

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
    String _birthdayMonth = DateTime.now().month.toString();
    String _birthdayDay = DateTime.now().day.toString();
    String _birthdayYear = DateTime.now().year.toString();
//created global key, needed for form
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    //using the _build naming convention for functions that return a widget
    Widget _buildFirstName() {
      return TextFormField(
          decoration: InputDecoration(labelText: 'First Name'),
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
          decoration: InputDecoration(labelText: 'Last Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Last Name is Required';
            }
          },
          onSaved: (value) {
            _lastName = value!;
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
                      _buildLastName(),
                      SizedBox(height: 20),
                      Expanded(
                        flex: 2,
                        child: Text('Enter your Region',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: DropdownButton(
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
                              child: Text('Connecticut - Maine - New England'),
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
                              child:
                                  Text('Idaho - Montana - Oregon - Washington'),
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
                                  lsc = ['Connecticut', 'Maine', 'New England'];
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
                      // sizedBox just to add more space
                      SizedBox(height: 20),
                      Text('Enter your Local Swim Committee',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: DropdownButton(
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
                      SizedBox(height: 20),
                      Text('Birthday Date',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                Future<Null> _selectDate(
                                    BuildContext context) async {
                                  DateTime? _datePicker = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2022),
                                  );

                                  if (_datePicker != null &&
                                      _datePicker != _birthday) {
                                    setState(() {
                                      _birthday = _datePicker;
                                      _birthdayDay = _datePicker.day.toString();
                                      _birthdayMonth =
                                          _datePicker.month.toString();
                                      _birthdayYear =
                                          _datePicker.year.toString();
                                    });
                                  }
                                }

                                _selectDate(context);
                              }),
                          SizedBox(width: 10),
                          Text(
                              '$_birthdayMonth / $_birthdayDay / $_birthdayYear ',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
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
                        int.parse(_birthdayYear.substring(2, 3));
                    print(birthdayYearFirst);

                    int birthdayYearSecond =
                        int.parse(_birthdayYear.substring(3, 4));
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

                    //parsing information from the website

                    final swimmerPage =
                        WebScraper("https://www.swimmingrank.com");
                    try {
                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td.ui-helper-center', ['']);
                        swimmerAge = elements[2]['title'];
                      } else {
                        Navigator.of(context).pop();
                      }

                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td > button', ['']);
                        swimmerClub = elements[0]['title'];
                      } else {
                        Navigator.of(context).pop();
                      }

                      if (await swimmerPage.loadWebPage(fullUrl)) {
                        List<Map<String, dynamic>> elements =
                            swimmerPage.getElement('td.ui-helper-center', ['']);
                        swimmerGender = elements[3]['title'];
                        setState(() {
                          swimmerList.add(SwimmerData(
                              _firstName + " " + _lastName,
                              swimmerIndex,
                              fullUrl,
                              swimmerAge,
                              swimmerClub,
                              swimmerGender));
                        });
                        Navigator.of(context).pop();
                        swimmerIndex++;
                      } else {
                        Navigator.of(context).pop();
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
                Text('Selected: '),
                Text(swimmer.name),
              ],
            ),
            actions: [
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
              MaterialButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]);
      },
    );
  }

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

  //swimmer template
  Widget swimmerTemplate(swimmer) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/swimmerinfo');
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
                Text('Age: ${swimmer.age} '),
              ]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${swimmer.url}',
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
              )
            ],
          ),
        ),
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
        body: ListView(
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
        floatingActionButton: SpeedDial(
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
