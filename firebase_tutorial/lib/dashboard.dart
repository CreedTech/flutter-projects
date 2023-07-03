import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthService().signOut();
          },
          child: const Text('SignOut'),
          style: ButtonStyle(
            elevation: MaterialStateProperty.resolveWith((states) => 7.0),
          ),
        ),
      ),
    );
  }
}
