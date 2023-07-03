import 'package:flutter/material.dart';

class Section {
  final String title;
  final IconData? leadingIcon;
  final Color? iconColor;
  final Color? textColor;
  final Function()? tap;

  Section({
    required this.title,
    this.leadingIcon,
    this.iconColor,
    this.textColor,
    this.tap,
  });
}

List<Section> section = [
  Section(
    title: 'Fancy Appbar',
    leadingIcon: Icons.home,
    iconColor: Colors.black,
    textColor: Colors.black,
    tap: (){},
  ),
  Section(
    title: 'Animations',
    leadingIcon: Icons.star,
    iconColor: Colors.black,
    textColor: Colors.black,
    tap: (){},
  ),
  Section(
    title: 'Animations',
    leadingIcon: Icons.star,
    iconColor: Colors.black,
    textColor: Colors.black,
    tap: (){},
  ),

];

