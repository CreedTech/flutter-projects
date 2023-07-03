import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_shared_prefs/home_page.dart';
import 'package:learning_shared_prefs/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData();
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    Timer(
        const Duration(seconds: 2),
            () => Get.to(() =>
        finalEmail == null ? const LoginPage() : const HomePage()));
    setState(() {
      finalEmail = obtainedEmail!;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              child: Icon(Icons.local_activity),
              radius: 50.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
