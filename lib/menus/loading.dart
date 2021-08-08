import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: JumpingDotsProgressIndicator(
          fontSize: 20.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
