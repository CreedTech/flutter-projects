import 'package:flutter/material.dart';

class FancyAppBar extends StatefulWidget {
  const FancyAppBar({Key? key}) : super(key: key);

  @override
  State<FancyAppBar> createState() => _FancyAppBarState();
}

class _FancyAppBarState extends State<FancyAppBar> {
  final ScrollController _scrollController = ScrollController();
  Color? appBarBackground;
  late double topPosition;

  @override
  void initState() {
    topPosition = -80;
    appBarBackground = Colors.transparent;
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  double _getOpacity(){
    double op = (topPosition + 80) / 80;
    return op > 1 || op < 0 ? 1 : op;
  }
  _onScroll(){
    if(_scrollController.offset > 50){
      if(topPosition < 0){
        setState(() {
          topPosition = -130 + _scrollController.offset;
          if(_scrollController.offset > 130) topPosition = 0;
        });
      }
      else {
        if(topPosition > -80){
          setState(() {
            topPosition--;
            if(_scrollController.offset <= 0) topPosition = -80;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 50),
                  height: 190,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(height: 70,),
                      Text(
                        "Simple app bar hiding animation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Text(
                        "Simple",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.orange
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0,),
                Container(
                  height: 300,
                  color: Colors.orange,
                ),
                const SizedBox(height: 20.0,),
                Container(
                  height: 300,
                  color: Colors.red,
                ),
                const SizedBox(height: 30.0,),
                Container(
                  height: 300,
                  color: Colors.yellow,
                ),
                const SizedBox(height: 10.0,),
                Container(
                  height: 300,
                  color: Colors.pink,
                ),
                const SizedBox(height: 10.0,),
              ],
            ),
          ),
          Positioned(
            top: topPosition,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.only(left: 50,top: 25.0, right: 20.0),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30)),
                color: Colors.white.withOpacity(_getOpacity()),
              ),
              child: DefaultTextStyle(
                style: const TextStyle(),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                child: Semantics(
                  child: const Text(
                      "Simple app bar hiding animation",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
