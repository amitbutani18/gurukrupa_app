import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gurukrupa/services/authService.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 15), () => AuthService().handleAuth());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Text(
            "Hello",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
