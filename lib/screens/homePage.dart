import 'package:flutter/material.dart';
import 'package:gurukrupa/services/authService.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('signOut'),
            onPressed: () {
              AuthService().signOut();
            },
          ),
        ),
      ),
    );
  }
}
