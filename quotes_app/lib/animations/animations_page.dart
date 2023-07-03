import 'package:flutter/material.dart';

import '../models/sections_list.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: section.length,
          itemBuilder: (BuildContext context, int index){
            Section connect = section[index];
            return ListTile(
              leading: Icon(connect.leadingIcon),
              iconColor: connect.iconColor,
              title: Text(connect.title),
              textColor: connect.textColor,
              onTap: connect.tap,
            );
          }
      ),
    );
  }
}
