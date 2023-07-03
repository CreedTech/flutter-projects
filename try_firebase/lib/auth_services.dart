import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:try_firebase/sign_up_page.dart';


class AuthService {
  // handles auth
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const SignUpPage();
        } else {
          return const Scaffold();
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
