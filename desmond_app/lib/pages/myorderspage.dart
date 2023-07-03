import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Orders',
        style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 28
        ),
      ),
    );
  }
}
