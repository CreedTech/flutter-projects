import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        // canvasColor: Color(0x0E1F50FF),
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
  final GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKEy,
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xff050609)),
          child: Drawer(
            elevation: 50.0,
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                Container(
                  // height: 150,
                  child: DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5eHs7krKinEpNEgKa4fbsOEW2MNpCVi9s0wZUQbCuSo261pWWiSXk_PTjdhNcK2mw2mw&usqp=CAU',
                                fit: BoxFit.contain,
                                width: 50,
                                height: 50,
                              ),
                              IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(Icons.close, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width,
                          // margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xff2b2c38),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0,10),
                                blurRadius: 50,
                                color: Colors.grey.withOpacity(0.23),
                              ),
                            ]
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Colors.white,),
                              hintText: 'Search',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(thickness: 2, color: Colors.grey),
                const ListTile(
                  leading: Icon(Icons.home, color: Colors.grey,size: 30,),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.grey,size: 30,),
                  title: Text(
                    'About',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.home, color: Colors.grey,size: 25,),
                  title: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.home, color: Colors.grey,size: 30,),
                  title: Text(
                    'Offers',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(Icons.expand_more, color: Colors.grey,size: 30,),
                ),
                const Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ),

        // backgroundColor: const Color(0x0E1F50FF),
        body: Stack(
          children: [
            IconButton(
              onPressed: () => _scaffoldKEy.currentState!.openDrawer(),
              icon: const Icon(Icons.menu, color: Colors.black),
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: const Center(child: Text('Entry A')),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[500],
                  child: const Center(child: Text('Entry B')),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: const Center(child: Text('Entry C')),
                ),
              ],
            )
          ],
        ),
        // body: SafeArea(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: const [
        //       ],
        //     ),
        //   ),
        // ),
        // bottomNavigationBar: BottomAppBar(
        //   color: Colors.black,
        //   shape: const CircularNotchedRectangle(),
        //   child: Container(
        //     color: Colors.black26,
        //     height: 50.0,
        //   ),
        // ),
        // drawer: Drawer(
        //   elevation: 50.0,
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: const [
        //       DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Color(0x0E1F50FF),
        //         ),
        //         child: Text('Drawer Header'),
        //       ),
        //       ListTile(
        //         title: Text('Inbox', style: TextStyle(color: Colors.white),),
        //         leading: Icon(Icons.mail),
        //       ),
        //       Divider(height: 0.1),
        //       ListTile(
        //         title: Text('Primary', style: TextStyle(color: Colors.white),),
        //         leading: Icon(Icons.inbox),
        //       ),
        //       ListTile(
        //         title: Text('Social', style: TextStyle(color: Colors.white),),
        //         leading: Icon(Icons.people),
        //       ),
        //       ListTile(
        //         title: Text('Promotions', style: TextStyle(color: Colors.white),),
        //         leading: Icon(Icons.local_offer),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
