import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'main_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid && !kIsWeb ? Brightness.dark : Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]
    );
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        platform: TargetPlatform.iOS,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: false,
        bottom: false,
        child: MainUI(),
      ),
      // AnimatedSplashScreen(
      //   duration: 1500,
      //   splash: Image.asset(
      //     'assets/img.png',
      //     fit: BoxFit.cover,
      //     width: double.infinity,
      //     height: double.infinity,
      //   ),
      //   // splash: const Icon(
      //   //   Icons.add_photo_alternate_outlined,
      //   //   color: Colors.white,
      //   //   size: 128,
      //   // ),
      //   nextScreen: const MainUI(),
      //   splashTransition: SplashTransition.fadeTransition,
      //   pageTransitionType: PageTransitionType.leftToRightWithFade,
      //   backgroundColor: const Color(0xffA13373),
      // ),
    );
  }
}
