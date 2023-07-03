import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'signup_page.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const LoginPage(),
      routes: <String, WidgetBuilder> {
        '/landingpage': (BuildContext context)=> const MyApp(),
        '/signup': (BuildContext context) => const SignUpPage(),
        '/homepage': (BuildContext context) => const HomePage(),
      },
    );
  }
}

