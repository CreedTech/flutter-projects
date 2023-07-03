import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2000),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.17),
                        spreadRadius: 10,
                        blurRadius: 90,
                        offset: const Offset(2, 10),
                      ),
                    ]),
                child: const Image(
                  alignment: Alignment.center,
                  image: AssetImage('assets/man.png'),
                  width: 400,
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                child: Text(
                  'The Simple way to find the best 👌',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      height: 2,
                      fontSize: 25),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    primary: Colors.purple[800]),
                // style: ButtonStyle(
                //   backgroundColor: MaterialStateProperty.resolveWith(
                //       (states) => Colors.purple[900]),
                //   padding: MaterialStateProperty.resolveWith((states) =>
                //       EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  primary: Colors.white12,
                ),
                // style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.resolveWith(
                //         (states) => Colors.purple[900]),
                //     padding: MaterialStateProperty.resolveWith((states) =>
                //         EdgeInsets.symmetric(horizontal: 50, vertical: 15))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.face,
                      color: Colors.white,
                    ),
                    Text(
                      'Sign in with Google',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

