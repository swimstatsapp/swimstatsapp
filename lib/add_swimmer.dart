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
  DateTime _dateTime = DateTime.now();
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
          margin: EdgeInsets.all(48),
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
                Text('Birthday (mm/dd/yy)',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Row(
                  children: <Widget> [
                    IconButton(
                      icon:Icon(Icons.calendar_today),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2021),
                        ).then((date) {
                          setState(() {
                            _dateTime = date!;
                          });
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()),
                  ],
                ),
                SizedBox(height:20),
                ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState!.validate() == true){ //.validate() function causes form to validate
                        _formKey.currentState!.save();
                        //values now stored in _firstName and _lastName
                        print("$_firstName");
                        print("$_lastName");
                        print("$_currentRegion");
                        print("$_currentState");
                        Navigator.pop(context);
                      }
                    }
                ),
                Row(
                  children: <Widget> [
                    Icon(Icons.info),
                    SizedBox(width: 10),
                    Text('SwimStats never stores any of your data. Read our'),
                    GestureDetector(
                        child: Text(" privacy policy.", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                        onTap: () {
                          // do what you need to do when "Click here" gets clicked
                        }
                    )
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





