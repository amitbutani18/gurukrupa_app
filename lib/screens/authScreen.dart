import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gurukrupa/services/authService.dart';
import 'package:http/http.dart' as http;

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _controller;
  TextEditingController _otpController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TextEditingController(text: '+91');
    _otpController = TextEditingController();
  }

  final _formKey = GlobalKey<FormState>();

  String phoneNo;
  String smsCode;
  String verificationId;
  bool codeSent = false;
  bool _loading = true;

  Future<void> verifyPhone(phoneNo) async {
    _formKey.currentState.validate();
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      await AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Image.asset('assets/images/welLogo.png'),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Gurukrupa",
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Electronics",
                        style: TextStyle(color: Colors.white, letterSpacing: 5),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Enter Mobile Number",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15),
                        child: TextFormField(
                          controller: _controller,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(color: Colors.white)),
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.length != 13) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              this.phoneNo = value;
                            });
                          },
                        ),
                      ),
                      codeSent
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 15),
                              child: TextFormField(
                                controller: _otpController,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: 'Enter OTP',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                keyboardType: TextInputType.phone,
                                style: TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (value.isEmpty && value.length != 6) {
                                    return 'Please enter OTP';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    this.smsCode = value;
                                  });
                                },
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 15,
                      ),
                      !_loading
                          ? CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 70),
                              color: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                              child: codeSent
                                  ? Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: 2),
                                    )
                                  : Text(
                                      "Verify",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          letterSpacing: 2),
                                    ),
                              onPressed: () {
                                if (codeSent) {
                                  AuthService()
                                      .signInWithOTP(smsCode, verificationId);
                                  setState(() {
                                    _loading = false;
                                  });
                                } else {
                                  verifyPhone(phoneNo);
                                  setState(() {
                                    _loading = true;
                                  });
                                }
                              },
                            ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
