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
  String? _currentRegion = 'Region 1';
  String? _currentState = 'State 1';//initialize with first region
  var regions = ['Region 1', 'Region 2'];
  var states = ['State 1', 'State 2'];
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
                  items: regions.map((String regions) {
                    return DropdownMenuItem(
                      value: regions,
                      child: Text(regions)
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentRegion = newValue;
                    });
                  },
                ),
                // sizedBox just to add more space
                SizedBox(height:20),
                Text('Enter your state',
                style: TextStyle(
                  fontSize: 20,
                )),
                DropdownButton(
                  value: _currentState,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: states.map((String states) {
                    return DropdownMenuItem(
                        value: states,
                        child: Text(states)
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _currentState = newValue;
                    });
                  },
                ),
                SizedBox(height:20),
                Text('Birthday',
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
                        print("$_currentState");
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





