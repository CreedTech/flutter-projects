import 'package:flutter/material.dart';

const kListStyle = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xff4A148C));
const kListTitleStyle =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black);

class DashBoard extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  const DashBoard(
      {Key? key,
      required this.name,
      required this.email,
      required this.password})
      : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple[900],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            elevation: 10,
            child: ListTile(
              title: const Text(
                'Name',
                style: kListTitleStyle,
              ),
              subtitle: Text(widget.name, style: kListStyle),
            ),
          ),
          Card(
            elevation: 10,
            child: ListTile(
              title: const Text(
                'Email',
                style: kListTitleStyle,
              ),
              subtitle: Text(
                widget.email,
                style: kListStyle,
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: ListTile(
              title: const Text(
                'Password',
                style: kListTitleStyle,
              ),
              subtitle: Text(
                widget.password,
                style: kListStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
