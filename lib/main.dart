import 'package:flutter/material.dart';
import 'package:gurukrupa/screens/authScreen.dart';
import 'package:gurukrupa/services/authService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        primaryColor: Color.fromRGBO(0, 222, 161, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthService().handleAuth(),
    );
  }
}
