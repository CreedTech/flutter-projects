import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: new ThemeData(
          canvasColor: Colors.grey,
),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        child: Container(
          color: Colors.black26,
          height: 50.0,
        ),
      ),
      drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: const [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.grey),
                accountName: Text('Creed'),
                accountEmail: Text('Creed@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('abc'),
              ),
            ),
            ListTile(
              title: Text('Inbox'),
              leading: Icon(Icons.mail),
            ),
            Divider(height: 0.1),
            ListTile(
              title: Text('Primary'),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              title: Text('Social'),
              leading: Icon(Icons.people),
            ),
            ListTile(
              title: Text('Promotions'),
              leading: Icon(Icons.local_offer),
            ),
          ],
        ),
      ),
    );
  }
}
