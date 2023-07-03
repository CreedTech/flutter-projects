import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_shared_prefs/login_page.dart';
import 'package:learning_shared_prefs/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        backgroundColor: Colors.black,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello $finalEmail',
              style: const TextStyle(fontSize: 20),
            ),
            MaterialButton(
                color: Colors.lightBlueAccent,
                child: const Text('Remove Credentials'),
                onPressed: () async {
                  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.remove('email');
                  Get.to(() =>const LoginPage());
                }),
          ],
        ),
      ),
    );
  }
}
