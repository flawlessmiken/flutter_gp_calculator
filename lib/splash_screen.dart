import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gp_calculator_app/form_screen.dart';

class SplashScreen extends StatelessWidget {
  BuildContext _context;

  startTimeOut() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  handleTimeout() {
    Navigator.pushReplacement(_context,
        MaterialPageRoute(builder: (BuildContext context) {
      return FormScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    startTimeOut();
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/images/flawlesslogo.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
