import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gurukrupa/screens/authScreen.dart';
import 'package:gurukrupa/screens/homePage.dart';
import 'package:http/http.dart' as http;

class AuthServices extends StatefulWidget {
  @override
  _AuthServicesState createState() => _AuthServicesState();
}

class _AuthServicesState extends State<AuthServices> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class AuthService {
  bool data = false;
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data.uid);
          final uid = snapshot.data.uid;
          // final db = FirebaseDatabase.instance
          //     .reference()
          //     .child("$uid")
          //     .child("profile");
          // final result = db.once().then((DataSnapshot userSnapshot) {
          //   Map<dynamic, dynamic> values = userSnapshot.value;
          //   if (userSnapshot.value != null) {
          //     values.forEach((key, value) {
          //       print(value['data']);
          //       if (value['data']) {
          //         print('personal');
          //       } else {
          //         print('home');
          //       }
          //     });
          //   }
          // });
          return HomePage(uid);
        } else {
          return AuthScreen();
        }
      },
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> signIn(AuthCredential authCredential) async {
    await FirebaseAuth.instance.signInWithCredential(authCredential);

    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final uid = user.uid;
    final url = 'https://gurukrupa-472c8.firebaseio.com/$uid/profile.json';

    final response = await http
        .get('https://gurukrupa-472c8.firebaseio.com/$uid/profile.json');

    if (response.statusCode == 200) {
      if (json.decode(response.body) != null) {
        print('true');
      } else {
        print('flase');
        http.put(url,
            body: json.encode({
              'mobile': user.phoneNumber,
              'fullName': '',
              'email': '',
              'gender': '',
              'data': true,
            }));
      }
      print(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCredential);
  }
}
