import 'package:flutter/material.dart';

import '../../styles/size_config.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.screenHeight! / 22.77, // 30
          fontWeight: FontWeight.bold,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}
