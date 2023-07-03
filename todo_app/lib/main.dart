import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const String svgName = 'assets/svg/blob.svg';
    return Scaffold(
      body: Container(
        width: double.infinity,
        // height: 800,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -55,
              left: -61,
              child: SvgPicture.asset('assets/blob.svg',
                  color: const Color(0xff9EF0F0).withOpacity(0.3),
                  semanticsLabel: 'vector'),
            ),
            Positioned(
              top: -123,
              left: 39,
              child: SvgPicture.asset('assets/blob.svg',
                  color: const Color(0xff9EF0F0).withOpacity(0.3),
                  semanticsLabel: 'vector'),
            ),
          ],
        ),
      ),

      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Stack(
      //       children: [
      //         Container(
      //           padding: EdgeInsets.zero,
      //           margin: EdgeInsets.zero,
      //           child: SvgPicture.asset('assets/blob.svg',color: const Color(0xff9EF0F0).withOpacity(0.4),width: 200, height: 200,),
      //         ),
      //
      //         Positioned(
      //           top: 90,
      //           left: 10,
      //           child: SvgPicture.asset('assets/blob.svg',color: const Color(0xff9EF0F0).withOpacity(0.4), width: 200, height: 200,),
      //         ),
      //         // Positioned(
      //         //   // top: 200,
      //         //   child:Center(
      //         //     child: Column(
      //         //       children: [
      //         //         Icon(Icons.watch_later_outlined, size: 20,),
      //         //       ],
      //         //     ),
      //         //   ),
      //         // ),
      //       ],
      //     ),
      //     Icon(Icons.watch_later_outlined, size: 100,),
      //   ],
      // ),
    );
  }
}
