import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_management.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25.0),
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
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((signedInUser) {
                            UserManagement().storeNewUser(signedInUser.user, context);
                          })
                      .catchError((e) {
                    print(e);
                  });
                },
                child: const Text('Sign Up'),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith((states) => 7.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
