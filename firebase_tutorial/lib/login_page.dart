import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// google provider for signing in with google form firebase
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;

  // google sign in
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  // Future<UserCredential> signInWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<String> signInWIthGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    assert(!user!.isAnonymous);

    final User? currentUser = _auth.currentUser;
    assert(user!.uid == currentUser!.uid);
    
    return 'signWIthGoogle successful:  $user';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              obscureText: true,
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((UserCredential user) {
                  Navigator.of(context).pushReplacementNamed('/homepage');
                }).catchError((e) {
                  print(e);
                });
              },
              child: const Text('Login'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 7.0),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/phonelogin');
              },
              child: const Text('Login with Phone Number'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 7.0),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                googleSignIn.signIn().then((result) {
                  result!.authentication.then((googleKey) {
                    signInWIthGoogle().then((signedInUser) {
                      print('Signed in as $signedInUser');
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    }).catchError((e){
                      print(e);
                    });
                  }).catchError((e){
                    print(e);
                });
                }).catchError((e) {
                  print(e);
                });
              },
              child: const Text('Login with Google'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 7.0),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text('Don\'t have an account?'),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text('Sign Up'),
              onPressed: () {
                Navigator.of(context).pushNamed('/signup');
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 7.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
