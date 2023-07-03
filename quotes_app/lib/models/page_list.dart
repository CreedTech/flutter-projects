import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/profiles/profile_one.dart';

import '../animations/animations_page.dart';

class PageList {
  final String title;
  final IconData? leadingIcon;
  final Color? iconColor;
  final Color? textColor;
  final Function()? tap;

  PageList({
    required this.title,
    this.leadingIcon,
    this.iconColor,
    this.textColor,
    this.tap,
  });
}

List<PageList> pageList =[
  PageList(
    title: 'Animations',
    leadingIcon: Icons.airport_shuttle,
    iconColor: Colors.white,
    textColor: Colors.white,
    tap: () => Get.to(const AnimationsPage()),
  ),
  PageList(
    title: 'profile',
    leadingIcon: Icons.person,
    iconColor: Colors.white,
    textColor: Colors.white,
    tap: () => Get.to(const ProfileOne()),
  ),
  PageList(
    title: 'Animations',
    leadingIcon: Icons.star,
    iconColor: Colors.white,
    textColor: Colors.white,
    tap: (){},
  ),

];