import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You are now logged in'),
            const SizedBox(
              height: 15.0,
            ),
            OutlinedButton(
              child: const Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator
                  .of(context)
                  .pushReplacementNamed('/landingpage');
                }).catchError((e) {
                  print(e);
                });
              },
              style: ButtonStyle(
                side: MaterialStateProperty.resolveWith(
                  (states) => const BorderSide(
                      color: Colors.red, style: BorderStyle.solid, width: 3.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
