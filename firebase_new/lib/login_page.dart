import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;

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
            const Text('Dont\'t have an account?'),
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
