import 'package:flutter/material.dart';

class Standards extends StatefulWidget {
  const Standards({Key? key}) : super(key: key);

  @override
  _StandardsState createState() => _StandardsState();
}

class _StandardsState extends State<Standards> {
  void initState() {
    super.initState();
    print('Calling initState for Messages');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Time Standards'),
      ),
    );
  }
}
