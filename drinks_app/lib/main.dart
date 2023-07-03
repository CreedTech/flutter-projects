import 'dart:io';

import 'package:drinks_app/view/home.dart';
import 'package:drinks_app/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';

var kBackgroundColor = const Color(0xff1e1e2c);
var kBackgroundColorII = const Color(0xff302e3d);
var boxName = 'myBox';
var box = Hive.box(boxName);
var userName = 'username';
// var internetStatus = '';
// var contentMessage = '';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox(boxName);
  runApp(const MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    bool isLogged = false;

    void isLoggedIn(){
      if(box.get(userName) == null){
        isLogged = true;
      } else {
        isLogged = false;
      }
    }

    @override
    void initState(){
      super.initState();
      isLoggedIn();
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drinks App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: isLogged ? const Home() : const LoginScreen(),
    );
  }
}

