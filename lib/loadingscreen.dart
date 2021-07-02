import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Opacity(
        opacity: 0.2,
        child: Center(
        ),
      ),
    );
  }
}
