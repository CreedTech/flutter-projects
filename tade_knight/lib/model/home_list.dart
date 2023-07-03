import 'package:flutter/material.dart';

class HomeList {
  HomeList({required this.navigateScreen, required this.imagePath});

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = <HomeList>[
    HomeList(
      navigateScreen: const Text(""),
      imagePath: '',
    ),
  ];
}
