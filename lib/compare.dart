import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
  const Compare({Key? key}) : super(key: key);

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  void initState() {
    super.initState();
    print('Calling initState for Compare');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Comparing Times'),
      ),
    );
  }
}
