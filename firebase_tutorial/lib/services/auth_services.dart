import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/phone_login.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';

class AuthService {
  // handles auth
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const DashBoardPage();
        } else {
          return const PhoneLoginPage();
        }
      },
    );
  }

  // Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Sign in
  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }
}
