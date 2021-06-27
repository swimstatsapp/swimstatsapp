import 'package:flutter/material.dart';

class AddSwimmer extends StatefulWidget {
  const AddSwimmer({Key? key}) : super(key: key);

  @override
  _AddSwimmerState createState() => _AddSwimmerState();
}

class _AddSwimmerState extends State<AddSwimmer> {
  String _firstName ='';
  String _lastName = '';
  String _swimmerMonth = '';
  String _swimmerDay = '';
  String _swimmerYear = '';
  String? _currentRegion = 'aft';
  String? _currentLSC = 'Florida';
  List<String> lsc = ['Florida','Florida Gold Coast','Southeastern'];//initialize with first region
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
          if(value == null || value.isEmpty) {
            return 'First Name is Required';
          }
        },
        onSaved: (value) {
          _firstName = value!;
        }
    );
  }
  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (value) {
        if(value == null || value.isEmpty) {
          return 'Last Name is Required';
        }
      },
      onSaved: (value) {
        _lastName = value!;
      }
    );
  }

  Future<Null> _selectDate (BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2022),
    );

    if(_datePicker != null && _datePicker != _birthday) {
      setState(() {
        _birthday = _datePicker;
        _birthdayDay = _datePicker.day.toString();
        _birthdayMonth = _datePicker.month.toString();
        _birthdayYear = _datePicker.year.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget> [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              ),
              Text('Add a Swimmer'),
            ],
          ),
        ),
        body: Container(
          //edge insets to add margin around the form
          padding: EdgeInsets.all(48),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                _buildFirstName(),
                _buildLastName(),
                SizedBox(height: 20),
              Text('Enter your Region',
                  style: TextStyle(
                    fontSize: 20,
                  )),
                DropdownButton(
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
                      child: Text('Colorado - New Mexico - Utah - Wyoming'),
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
                      child: Text('Delaware- New Jersey - Pennsylvania'),
                      value: 'dnp',
                    ),
                    DropdownMenuItem(
                      child: Text('Georgia - North Carolina - South Carolina'),
                      value: 'nc',
                    ),
                    DropdownMenuItem(
                      child: Text('Hawaii'),
                      value: 'hi',
                    ),
                    DropdownMenuItem(
                      child: Text('Idaho - Montana - Oregon - Washington'),
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
                      child: Text('Minnesota - North Dakota - South Dakota - Wisconsin'),
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
                      child: Text('Arkansas - Kansas - Missouri - Nebraska - Oklahoma'),
                      value: 'kmno',
                    ),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentRegion = newValue;

                      if(_currentRegion == 'aft') {
                        setState(() {
                          lsc = ['Florida','Florida Gold Coast','Southeastern'];
                          _currentLSC = 'Florida';
                        });
                      }
                      if(_currentRegion == 'ak') {
                        setState(() {
                          lsc = ['Alaska','None'];
                          _currentLSC = 'Alaska';
                        });
                      }
                      if(_currentRegion == 'az') {
                        setState(() {
                          lsc = ['Arizona','None'];
                          _currentLSC = 'Arizona';
                        });
                      }
                      if(_currentRegion == 'cal') {
                        setState(() {
                          lsc = ['Southern California','Pacific','San Diego - Imperial', 'Central', 'Sierra Nevada'];
                          _currentLSC = 'Southern California';
                        });
                      }
                      if(_currentRegion == 'cnw') {
                        setState(() {
                          lsc = ['Colorado','New Mexico','Utah', 'Wyoming'];
                          _currentLSC = 'Colorado';
                        });
                      }
                      if(_currentRegion == 'ne') {
                        setState(() {
                          lsc = ['Connecticut','Maine','New England'];
                          _currentLSC = 'Connecticut';
                        });
                      }
                      if(_currentRegion == 'mdva') {
                        setState(() {
                          lsc = ['Maryland','Potomac Valley','Virginia'];
                          _currentLSC = 'Maryland';
                        });
                      }
                      if(_currentRegion == 'dnp') {
                        setState(() {
                          lsc = ['Allegheny Mountain','Mid Atlantic','New Jersey'];
                          _currentLSC = 'Allegheny Mountain';
                        });
                      }
                      if(_currentRegion == 'nc') {
                        setState(() {
                          lsc = ['Georgia','North Carolina','South Carolina'];
                          _currentLSC = 'Georgia';
                        });
                      }
                      if(_currentRegion == 'hi') {
                        setState(() {
                          lsc = ['Hawaii','None'];
                          _currentLSC = 'Hawaii';
                        });
                      }
                      if(_currentRegion == 'imow') {
                        setState(() {
                          lsc = ['Inland Empire','Montana','Oregon','Pacific Northwest','Snake River'];
                          _currentLSC = 'Inland Empire';
                        });
                      }
                      if(_currentRegion == 'ii') {
                        setState(() {
                          lsc = ['Illinois','Iowa'];
                          _currentLSC = 'Illinois';
                        });
                      }
                      if(_currentRegion == 'in') {
                        setState(() {
                          lsc = ['Indiana','None'];
                          _currentLSC = 'Indiana';
                        });
                      }
                      if(_currentRegion == 'kywv') {
                        setState(() {
                          lsc = ['Kentucky','West Virginia'];
                          _currentLSC = 'Kentucky';
                        });
                      }
                      if(_currentRegion == 'leoh') {
                        setState(() {
                          lsc = ['Lake Erie','Michigan','Ohio'];
                          _currentLSC = 'Lake Erie';
                        });
                      }
                      if(_currentRegion == 'lams') {
                        setState(() {
                          lsc = ['Louisiana','Mississippi'];
                          _currentLSC = 'Louisiana';
                        });
                      }
                      if(_currentRegion == 'mmw') {
                        setState(() {
                          lsc = ['Minnesota','North Dakota','South Dakota','Wisconsin'];
                          _currentLSC = 'Minnesota';
                        });
                      }
                      if(_currentRegion == 'ny') {
                        setState(() {
                          lsc = ['Adirondack','Metropolitan','Niagara'];
                          _currentLSC = 'Adirondack';
                        });
                      }
                      if(_currentRegion == 'tx') {
                        setState(() {
                          lsc = ['Border','Gulf','North Texas','South Texas','West Texas'];
                          _currentLSC = 'Border';
                        });
                      }
                      if(_currentRegion == 'kmno') {
                        setState(() {
                          lsc = ['Arkansas','Missouri Valley','Oklahoma','Midwestern','Ozark'];
                          _currentLSC = 'Arkansas';
                        });
                      }
                    });
                  },
                ),
                // sizedBox just to add more space
                SizedBox(height:20),
                Text('Enter your Local Swim Committee',
                style: TextStyle(
                  fontSize: 20,
                )),
                DropdownButton(
                  value: _currentLSC,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: lsc.map((String lsc) {
                    return DropdownMenuItem(
                        value: lsc,
                        child: Text(lsc)
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentLSC = newValue;
                    });
                  },
                ),
                SizedBox(height:20),
                Text('Birthday Date',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Row(
                  children: <Widget> [
                    IconButton(
                      icon:Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      }
                    ),
                    SizedBox(width: 10),
                    Text('$_birthdayMonth / $_birthdayDay / $_birthdayYear ',
                    style: TextStyle(
                        fontSize: 20,
                    )),
                  ],
                ),
                SizedBox(height:20),
                ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState!.validate() == true){ //.validate() function causes form to validate
                        _formKey.currentState!.save();
                        //values now stored in _firstName and _lastName

                        //check your console for output
                        //route this data to the identifier creator file
                        print("$_firstName");
                        print("$_lastName");
                        print("$_currentRegion");
                        print("$_currentLSC");
                        print("$_birthday");
                        print("$_birthdayMonth");
                        print("$_birthdayDay");
                        print("$_birthdayYear");
                        Navigator.pop(context);
                      }
                    }
                ),
                Row(
                  children: <Widget> [
                    IconButton(
                        icon: Icon(
                            Icons.info,
                            color: Colors.blueAccent),
                        onPressed:() {
                          Navigator.pushNamed(context, '/privacypolicy');
                        },
                    ),
                    SizedBox(width: 10),
                    Flexible(
                        child: Text('SwimStats never stores any of your data. Click the icon to read our privacy policy.')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





