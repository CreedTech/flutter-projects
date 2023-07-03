import 'package:flutter/material.dart';
import 'package:try_firebase/sign_up_page.dart';

import 'auth_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthService().handleAuth(),
      routes: <String, WidgetBuilder>{
        '/landingPage': (BuildContext context) => const MyApp(),
        '/signup': (BuildContext context) => const SignUpPage(),
      },
    );
  }
}


