import 'dart:async';

import 'package:flutter/material.dart';

class TextTime extends StatefulWidget {
  final Widget child;
  const TextTime({Key? key, required this.child}) : super(key: key);

  @override
  State<TextTime> createState() => _TextTimeState();
}

class _TextTimeState extends State<TextTime> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
