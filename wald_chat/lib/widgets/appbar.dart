import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

AppBar header(context) {
  return AppBar(
    title: const Text('Wald'),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(Feather.bell),
      ),
    ],
  );
}
