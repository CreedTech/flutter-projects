import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Icon(icon, size: 100,),
      const SizedBox(height:  16,),
      Text(
        text!,
        style: const TextStyle(fontSize: 42, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
