import 'package:flutter/material.dart';

class Times extends StatefulWidget {
  const Times({Key? key}) : super(key: key);

  @override
  _TimesState createState() => _TimesState();
}

class _TimesState extends State<Times> {
  void initState() {
    super.initState();
    print('Calling initState for Times');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Times'),
      ),
    );
  }
}
