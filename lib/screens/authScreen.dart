import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gurukrupa/services/authService.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = TextEditingController(text: '+91');
  }

  final _formKey = GlobalKey<FormState>();

  String phoneNo;
  String smsCode;
  String verificationId;
  bool codeSent = false;

  Future<void> verifyPhone(phoneNo) async {
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
                        if (value.isEmpty) {
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
                            decoration: const InputDecoration(
                              hintText: 'Enter OTP',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value.isEmpty) {
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
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Theme.of(context).primaryColor),
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
                      codeSent
                          ? AuthService().signInWithOTP(smsCode, verificationId)
                          : verifyPhone(phoneNo);
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
