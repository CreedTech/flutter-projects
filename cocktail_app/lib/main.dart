import 'dart:io';

import 'package:cocktail_app/view/home.dart';
import 'package:cocktail_app/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

var kBackgroundColors = const Color(0xff1e1e2c);
var kBackgroundColorII = const Color(0xff302e3d);
var box = Hive.box('myBox');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogged = false;

  void isLoggedIn() {
    if (box.get('username') != null) {
      isLogged = true;
    } else {
      isLogged = false;
    }
  }

  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: isLogged ? const MyHome() : const LoginScreen(),
    );
  }
}
