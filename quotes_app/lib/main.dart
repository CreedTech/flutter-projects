import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/animations/bottom_bar.dart';
import 'package:quotes_app/animations/fancy_app_bar.dart';
import 'package:quotes_app/dashboard.dart';
import 'package:quotes_app/models/page_list.dart';
import 'package:quotes_app/models/sections_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.black),
      home: const QuotePage(),
    );
  }
}

class QuotePage extends StatelessWidget {
  const QuotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Quote App"),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        elevation: 0,
      ),
      body: const DashBoardPage(),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: _buildDrawer(),
      ),
    );
  }


  _buildDrawer() {
    final drawerItems = ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: pageList.length,
      itemBuilder: (BuildContext context, int index) {
        PageList connect = pageList[index];
        return ListTile(
          leading: Icon(connect.leadingIcon),
          iconColor: connect.iconColor,
          title: Text(connect.title),
          textColor: connect.textColor,
          onTap: connect.tap,
        );

      },
    );
    return ClipPath(
      // clipper: OvalRightBorderClipper(),
      child: Drawer(
        elevation: 20,
        child: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 20),
          decoration: const BoxDecoration(
            color: Colors.black, boxShadow: [
            BoxShadow(
              color: Colors.black45,
            ),
          ],
          ),
          width: 150,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 70,
                        width: 70,
                        // alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back, size: 20, color: Colors.white,),
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  const Divider(thickness: 2, color: Colors.purple,),
                  const SizedBox(height: 10.0),
                  drawerItems
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
