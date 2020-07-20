import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gurukrupa/screens/authScreen.dart';
import 'package:gurukrupa/screens/homePage.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
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
  }

  Future<void> signInWithOTP(smsCode, verId) async {
    AuthCredential authCredential = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    await signIn(authCredential);
  }
}
