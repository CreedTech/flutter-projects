import 'package:firebase_tutorial/phone_login.dart';
import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthService().handleAuth(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => const MyApp(),
        '/signup': (BuildContext context) => const SignUpPage(),
        '/homepage': (BuildContext context) => const HomePage(),
        '/phonelogin': (BuildContext context) => const PhoneLoginPage(),
      },
    );
  }
}
