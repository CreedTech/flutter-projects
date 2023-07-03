import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff22252D),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff2A2D36),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.wb_sunny),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.fromLTRB(
                      20,
                      20,
                      5,
                      5
                    ),
                width: MediaQuery.of(context).size.width,
                height: 450,
                decoration: const BoxDecoration(
                  color: Color(0xff2A2D36),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: const [
                    ButtonWidget(),
                    ButtonWidget(),
                    ButtonWidget(),
                    ButtonWidget(),
                    ButtonWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SingleButton(
          buttonColor: Colors.teal,
        ),
        SingleButton(
          buttonColor: Colors.teal,
        ),
        SingleButton(
          buttonColor: Colors.teal,
        ),
        SingleButton(
          buttonColor: Colors.red,
        ),
      ],
    );
  }
}

class SingleButton extends StatelessWidget {
  const SingleButton({
    Key? key, this.buttonText, this.buttonColor, this.press,
  }) : super(key: key);

  final String? buttonText;
  final Color? buttonColor;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 68,
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xff22252D).withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "AC",
          style: TextStyle(
            color: buttonColor,
            fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: ElevatedButton(
    //     onPressed: () {},
    //     child:  Text("AC",
    //     style: TextStyle(
    //       color: buttonColor,
    //       fontSize: 20,
    //       fontWeight: FontWeight.bold
    //     ),),
    //     style: ButtonStyle(
    //       elevation: MaterialStateProperty.resolveWith((states) => 0),
    //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //         RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //       ),
    //       padding: MaterialStateProperty.resolveWith(
    //           (states) => const EdgeInsets.symmetric(horizontal: 20,vertical: 20)),
    //       backgroundColor: MaterialStateProperty.resolveWith(
    //           (states) => const Color(0xff22252D).withOpacity(0.4)),
    //     ),
    //   ),
    // );
  }
}
