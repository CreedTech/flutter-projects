import 'package:flutter/material.dart';

class MyaccountsPage extends StatelessWidget {
  const MyaccountsPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'My Accounts',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 28
        ),
      ),
    );
  }
}
