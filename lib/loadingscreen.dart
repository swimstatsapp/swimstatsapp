import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.black.withOpacity(0.1),
          child: Center(child: Text('Loading'))),
    );
  }
}
