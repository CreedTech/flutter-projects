import 'package:desmond_app/pages/homepage.dart';
import 'package:desmond_app/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          HomePage(),
          SideBar(),
        ],
      ),
    );
  }
}
